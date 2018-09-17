ActiveAdmin.register UserCourse do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
tab_name = controller.controller_name.classify
menu if: proc { current_admin_user.show_tab?(tab_name) }
  permit_params :user_id, :course_id
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    inputs "Assign Course to Teacher" do
      input :course
      input :user,member_label: :email,
            :as => :select,
            :collection => User.teachers {|user| [user.email, user.id] }
    end
  f.actions
  end

  controller do
    include AdminHelper
    def allowed_actions
      action_methods
    end
  end

end
