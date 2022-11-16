class ShortUrl < ApplicationRecord

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze

  validates :full_url, url: true

  def short_code
  end

  def update_title!
  end

  private

  def validate_full_url
  end

end
