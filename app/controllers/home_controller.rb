class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.where(name: request.subdomain)
  end
end
