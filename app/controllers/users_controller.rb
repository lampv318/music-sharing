class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Create Account Successfully"
      redirect_to root_url
    else
      flash_msg = []
      @user.errors.full_messages.each do |msg|
        flash_msg << msg
      end
      flash[:danger] = flash_msg.join('<br>')
      redirect_to signup_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
