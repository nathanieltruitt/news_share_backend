# represents a channel from youtube. Channels are not associated to users who have bookmarked them they're
# directly associated to videos that have been bookmarked.
class Channel < ApplicationRecord
  has_many :videos
end
