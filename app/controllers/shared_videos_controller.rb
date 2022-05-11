class SharedVideosController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
  end

  def create
    shared_video = current_user.shared_videos.new(url: params[:url])
    if shared_video.save
      flash[:success] = "Share Youtube Video Successfully"
    else
      flash_msg = []
      shared_video.errors.full_messages.each do |msg|
        flash_msg << msg
      end
      flash[:danger] = flash_msg.join(' & ')
    end

    redirect_to root_url
  end
end
