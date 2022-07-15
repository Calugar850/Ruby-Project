class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_domain!(request.subdomain)
    @users = User.all
  end

  def new
    u = User.new(user_params)
    u.save
    u.errors
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User saved successfully'
      redirect_to show
    else
      flash[:alert] = 'User was not saved.'
    end
  end

  private

  def user_params
    params.permit(:username, :name, :email, :password, :current_password, :domain)
  end
end
