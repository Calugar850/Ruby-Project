class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save(:validate=> false)
      redirect_to users_admin_index_path
    else
      render new_users_admin_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :current_password, :domain, :role)
  end



end
