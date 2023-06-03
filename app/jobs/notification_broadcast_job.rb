class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast "notification_channel", { message: 'sample' }
  end
end
