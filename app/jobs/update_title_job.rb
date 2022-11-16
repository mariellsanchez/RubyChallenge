class UpdateTitleJob < ApplicationJob
  queue_as :default

  def perform(short_url)
    short_url.update_title!
  end
end
