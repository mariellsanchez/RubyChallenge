class ShortUrlsController < ApplicationController

  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  def index
    # need to fix here
    @short_urls = ShortUrl.all 
    render json: {
      status: "SUCCESS",
      message: 'Loaded data',
      data: @short_urls
    },
    status: :ok
  end

  def show
    @single_url = ShortUrl.find(params[:id])
    render json: {
      status: "SUCCESS",
      message: 'Loaded short url',
      data: @single_url
    },
    status: :ok
  end

  def create
    @short_url = ShortUrl.new(short_url_params)

    if @short_url.save
      render json: {
        status: "SUCCESS",
        message: 'Short url saved',
        short_code: @short_url.id,
        data: @short_url
      },
      status: :created
    else
      render json: {
        status: "ERROR",
        message: 'Short url NOT saved',
        data: @short_url.errors
      },
      status: :unprocessable_entity
    end
  end

  private

  def short_url_params
    # the only params we are going to permit
    params.permit(:full_url)
  end

  
end
