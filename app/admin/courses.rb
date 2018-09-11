ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index download_links: [:csv]

  csv force_quotes: true, col_sep: ',' do
    column "Courses" do |c|
      c.name
    end
    column ("Teachers") { |course| course.users.teachers.pluck(:name).join(", ") }
    column ("Students") { |course| course.users.students.pluck(:name).join(", ") }
  end

end
