class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to users_admin_index_path
    else
      render 'new'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :domain)
  end

end
