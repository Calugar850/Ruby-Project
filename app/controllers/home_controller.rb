class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_domain!(request.subdomain)
    @users = User.all
  end
end
