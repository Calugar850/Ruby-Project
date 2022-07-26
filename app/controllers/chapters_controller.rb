class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find(params[:id])
  end

  def index
    @chapter = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to courses_path
    else
      render new_chapter_path
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      redirect_to courses_path
    else
      redirect_to edit_chapter_path
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name, :description, :school_id, :teacher_id, :id_course, :teacher_updated_id)
  end
end
