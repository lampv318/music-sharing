class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(title, by_user_email)
    ActionCable.server.broadcast "notification_channel", { title: title, by_user_email: by_user_email }
  end
end
