class AdminController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = Friend.new(friend_params)
  end

  def friend_params
    params.require(:user).permit(:username, :name, :email, :password, :current_password, :domain, :role)
  end
end
