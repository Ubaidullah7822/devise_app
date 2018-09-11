ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_type, :email, :password, :password_confirmation
  scope :teachers
  scope :students
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#select('name').joins(:user_courses).where('user_type' => 'Teacher')
  csv do
    #column(:usercourse) { |usercourse| usercourse.course.name }
    column :name
    column :user_type
    # column(:course) { Course.each do |course|
    #   course.users.students.map(&:name).join(", ")
    # end }
    # column(:user_course) { |user| user.courses.name }
    #column(:user_course) { |user| user.joins(:user_courses).where(user_type: "Teacher") }
    #column(:user) { |usercourse| usercourse.user.where(user_type: "Student").name }
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :user_type
    actions
  end

form do |f|
    f.inputs do
      f.input :user_type
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
