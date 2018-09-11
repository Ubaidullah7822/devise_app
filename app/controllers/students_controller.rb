class StudentsController < ApplicationController

  def show
    @courses = current_user.courses
  end

  def register
    @current_user
    @courses = Course.pluck(:name)
  end

  def assign
    @usrcourse = UserCourse.new
    status, message = @usrcourse.register_course(params[:course],params[:id],current_user)
    if status
      redirect_to student_path(current_user), notice: message
    else
      render :register
    end
  end

end
