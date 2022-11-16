class ShortUrlsController < ApplicationController

  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  def index
    @short_urls = ShortUrl.all 
    render json: {
      status: "SUCCESS",
      message: 'Loaded data',
      data: @short_urls
    },
    status: :ok
  end

  def show
    begin
      @single_url = ShortUrl.find(params[:id])
      @single_url.update_attribute(:click_count, @single_url.click_count += 1)
      redirect_to @single_url.full_url, allow_other_host: true
    rescue => e
      render json: {
        status: "ERROR",
        message: 'Not such link',
        data: e
      },
      status: 404
    end
    
  end

  def create
    @short_url = ShortUrl.new(short_url_params)

    if @short_url.save
      UpdateTitleJob.perform_later(@short_url)
      render json: {
        status: "SUCCESS",
        message: 'Short url saved',
        short_code: @short_url.id.to_s,
        data: @short_url
      },
      status: :created
    else
      render json: {
        status: "ERROR",
        message: 'Short url NOT saved',
        errors: "Full url is not a valid url",
        data: @short_url.errors
      },
      status: :unprocessable_entity
    end
  end
  
  def top
    @top = ShortUrl.order(click_count: :desc).limit(100)
    render json: {
      status: "SUCCESS",
      message: 'Top 100 urls most accessed loaded',
      urls: @top
    },
    status: :ok
  end

  private

  def short_url_params
    params.permit(:full_url)
  end

end
