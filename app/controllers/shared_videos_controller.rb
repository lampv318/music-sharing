class SharedVideosController < ApplicationController
  def index; end

  def create
    unless VideoEmbedUrlGenerator.new(shared_video_params[:url]).valid?
      flash[:danger] = "Invalid URL"

      return redirect_to root_url
    end

    current_user.shared_videos.create(shared_video_params) ? flash[:success] = "Share Youtube Video Successfully" : flash[:danger] = "Somthing Went Wrong !"

    redirect_to root_url
  end

  def shared_video_params
    params.require(:shared_video).permit(:title, :url)
  end
end
