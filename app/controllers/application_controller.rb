class ApplicationController < ActionController::Base
  include SessionsHelper

  # rescue ActionController::RoutingError do |_e|
  #   binding.pry
  #   render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false, content_type: 'text/html'
  # end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
