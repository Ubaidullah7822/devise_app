class RegisterController < ApplicationController

  def show
    @courses = current_user.courses
  end
  def register
    @current_user
    @courses = Course.pluck(:name)
  end

  def assign
    course = Course.find_by_name(params[:course])
    usrcourse = UserCourse.new
    usrcourse.user_id = params[:id]
    usrcourse.course_id = course.id
    puts "---------#{usrcourse.user_id}"
    puts "---------#{usrcourse.course_id}"
    #check if teacher is already has course
    if current_user.user_type == "Teacher"
      teacher_courses = current_user.courses
      if teacher_courses.count >0
        puts "-----Teacher Cant register"
        flash[:notice] = 'Teacher Cant register more than one course'
        render "register"
      elsif (usrcourse.save)
        puts "-----saved"
        #flash[:notice] = 'Successfully registered'
        redirect_to register_path(current_user)
      end
    elsif current_user.user_type == "Student"
      puts "----------student-1"
      student_courses = current_user.courses
      puts "----------student-2"
        if student_courses.exists?(course.id)
          puts "-----cant register course twice"
          flash[:notice] = 'cant register course twice'
          render "register"
        elsif student_courses.count == 4
          puts "-----cant register more than 4"
          flash[:notice] = 'cant register more than 4'
          render "register"
        elsif (usrcourse.save)
          puts "-----saved"
          redirect_to register_path(current_user), notice: 'Course registered sucess'
        end
    end
  end
end
