require 'nokogiri'
require 'open-uri'

class ShortUrl < ApplicationRecord

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze

  validates :full_url, url: true
  

  def short_code
  end

  def update_title!
    # Gets the URL page title and stores it in @title
    URI.open(full_url) do |f|
      doc = Nokogiri::HTML(f)
      @title = doc.at_css('title').text
      puts @title
    end

    update(title: @title)
  end

  private

  def validate_full_url
  end

end
