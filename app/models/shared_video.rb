class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  YOUTUBE_REGEX_URL = %r{(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{8,11})}.freeze
  validates :url, presence: true, format: { with: YOUTUBE_REGEX_URL }
end
