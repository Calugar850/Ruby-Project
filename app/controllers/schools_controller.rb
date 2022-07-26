class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
    @user = User.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      create_user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create_user
    @user = User.new(user_params)
    @user.save(:validate => false)
  end

  private

  def school_params
    params.require(:school).permit(:name, :domain)
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :current_password, :password_confirmation, :domain, :role, :id_school)
  end

end
