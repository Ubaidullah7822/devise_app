ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  tab_name = controller.controller_name.classify
  menu if: proc { current_admin_user.show_tab?(tab_name) }
  permit_params :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  sidebar :help do
      "Need help? Email us at help@example.com"
    end





  index download_links: [:csv]

  csv force_quotes: true, col_sep: ',' do
    column "Courses" do |c|
      c.name
    end
    column ("Teachers") { |course| course.users.teachers.pluck(:name).join(", ") }
    column ("Students") { |course| course.users.students.pluck(:name).join(", ") }
  end


  controller do
    include AdminHelper
    def allowed_actions
      action_methods
    end
  end

end
