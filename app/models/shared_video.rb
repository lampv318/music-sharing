class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :url, presence: true
  after_create_commit :send_notification

  def send_notification
    NotificationBroadcastJob.perform_later
  end
end
