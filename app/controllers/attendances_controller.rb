class AttendancesController < ApplicationController
  def new
    attendance = Attendance.create(course_id: params[:course_id],student_id: params[:student_id], attended: 0)
    attendance.errors.full_messages
    redirect_to course_path(id: params[:course_id])  
  end

  def create
    Attendance.create(course_id: params[:course_id],student_id: params[:student_id], attended: 0)
    redirect_to course_path(id: params[:course_id])  
  end

  def show
    @lectures = Attendance.where(course_id: params[:id])
  end

  def edit
    @attendances = Attendance.where(course_id: params[:id])
    @course = Course.find(params[:id])
    @course.increment!(:classes)
    for attendance in @attendances
      if params[attendance.student_id.to_s] == 'Present'
        attendance.increment!(:attended)
      end
    end  
  end


  def delete
  end

  def destroy
  end
end
