ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name,:user_type, :email, :password,
                 :password_confirmation, :course_ids => []
  scope :teachers
  scope :students

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  filter :user_type

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :user_type
    actions
  end

form do |f|
    f.inputs "Details" do
      f.input :user_type
      f.input :name
      f.input :email
      f.input :courses, as: :check_boxes,
               :collection => Course.all.map { |course|  [course.name, course.id] }
      f.input :password
      f.input :password_confirmation
    end
    f.actions
end
end
