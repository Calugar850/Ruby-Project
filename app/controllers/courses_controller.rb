class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @chapters = Chapter.all
  end

  def index
    @course = Course.all
  end

  def all_courses
    if current_user.role == "student"
      @enroll
      @courses = Course.all
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render new_course_path
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      redirect_to edit_course_path
    end
  end


  def new_chapter
    @chapter = Chapter.new
    @course = Course.find(params[:id])
  end

  def create_chapter
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to courses_path
    else
      render new_chapter_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :school_id, :teacher_id, :acces_key)
  end

  def chapter_params
    params.require(:chapter).permit(:name, :description, :school_id, :teacher_id, :id_course, :teacher_updated_id)
  end

end
