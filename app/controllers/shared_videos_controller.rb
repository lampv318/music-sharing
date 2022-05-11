class SharedVideosController < ApplicationController
  def index
  end

  def create
    unless VideoEmbedUrlGenerator.new(params[:url]).valid?
      flash[:danger] = "Invalid URL"

      return redirect_to root_url
    end

    current_user.shared_videos.create(url: params[:url]) ? flash[:success] = "Share Youtube Video Successfully" : flash[:danger] = "Somthing Went Wrong !"

    redirect_to root_url
  end
end
