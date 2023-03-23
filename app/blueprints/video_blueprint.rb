# frozen_string_literal: true

# defines the JSON format for a video model
class VideoBlueprint < Blueprinter::Base
  identifier :id
  fields :content_url, :title, :published_at
  field :thumbnail do |video, _options|
    {
      thumbnail_url: video.thumbnail_url,
      thumbnail_width: video.thumbnail_width,
      thumbnail_height: video.thumbnail_height
    }
  end
end
