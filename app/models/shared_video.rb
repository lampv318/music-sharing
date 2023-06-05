class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :url, presence: true
  validates :title, presence: true

  after_create :send_notification

  def send_notification
    NotificationBroadcastJob.perform_later(title, user.email)
  end
end
