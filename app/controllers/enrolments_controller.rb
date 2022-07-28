class EnrolmentsController < ApplicationController
  def new
    @enroll = Enrolment.new
    @course = Course.find(params[:id])
  end

  def create
    @enroll = Enrolment.new(student_id: enroll_params[:student_id], course_id: enroll_params[:course_id])
    @course = Course.find_by_id(@enroll.course_id)
    if @course.acces_key == ""
      if @enroll.save(:validate=> false)
        redirect_to @course
      end
    else
      key = String.new(enroll_params[:key])
      if @course.acces_key == key
        if @enroll.save(:validate=> false)
          redirect_to @course
        end
      else
        redirect_to "/course/"+@course.id.to_s+"/enroll"
      end
    end
  end

  private

  def enroll_params
    params.require(:enrolment).permit(:student_id, :course_id, :key)
  end

end
