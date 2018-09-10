class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def register_course( course_name, user_id, current_user)
    course = Course.find_by_name(course_name)
    self.user_id = user_id
    self.course_id = course.id

    if has_course_limit?(current_user)
      if !registering_same_course_twice?(current_user)
        return self.save, "Register Success"
      else
        return false, "cant register course twice"
      end
    else
      return false, "cant register more than 4"
    end
  end

  def has_course_limit?(current_user)
    current_user.courses.count < 4
  end

  def registering_same_course_twice?(current_user)
    current_user.courses.exists?(course.id)
  end

end

