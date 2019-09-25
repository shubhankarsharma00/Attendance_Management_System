class SubjectsController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(subject_name: subject_params[:subject_name])
    @course = Course.create(subject_id: @subject.id, teacher_id: current_teacher.id, classes: 0)
    redirect_to course_path(@course.id)
  end

  def delete
  end
  def destroy
  end
  private

  def subject_params
    params.require(:subject).permit(:subject_name)
  end  
end
