ActiveAdmin.register UserCourse do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_id, :course_id
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#member_label: :email
#f.input :product, :as => :select, :collection => Product.all.collect {|product| [product.name, product.id] }
  form do |f|
    inputs "Assign Course to Teacher" do
      input :course
      input :user,member_label: :email, :as => :select, :collection => User.where(user_type: "Teacher") {|user| [user.email, user.id] }
    end
  f.actions
  end

end
