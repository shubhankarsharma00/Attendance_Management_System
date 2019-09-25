class LearningController < ApplicationController
  def new
    @learning = Learning.create(:course_id => params[:course_id], :student_id => params[:student_id]  )
    redirect_to new_attendance_path(course_id: @learning.course_id,student_id: @learning.student_id)
  end
end
