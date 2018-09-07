class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  #, if: :is_teacher? && :has_course?

  # def is_teacher?
  #   current_user.user_type == "Teacher"
  # end

  # def has_course?
  #   current_user.id == UserCourse.user_id
  # end
end
