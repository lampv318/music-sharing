class HomeController < ApplicationController
  def index
    @shared_videos = SharedVideo.all
  end

  def show
    render file: "public/404.html", status: :not_found unless valid_page?
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
