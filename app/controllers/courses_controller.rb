class CoursesController < ApplicationController
  def index
    @courses = Course.all()
  end

  def show
    @course = Course.find(params[:id])
    @learnings = Learning.where(course_id: @course.id )
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(subject_id: course_params[:subject_id],teacher_id: current_teacher.id,classes:0)
    redirect_to course_path(id: @course.id)
    # redirect_to assignment_path(question_params[:assignment_id])
  end

  def delete
  end

  def destroy
  end
  private

  def course_params
    params.require(:course).permit(:subject_id)
  end  
end
