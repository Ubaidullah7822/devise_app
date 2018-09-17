
ActiveAdmin.register AdminUser do
  #extend Confirmable
    tab_name = controller.controller_name.classify
    menu if: proc { current_admin_user.show_tab?(tab_name) }
    #menu parent: "Blog"
    includes :admin_user_tabs, :tabs

  permit_params :email, :password, :password_confirmation,
  admin_user_tabs_attributes: [ :tab_id, :access, :id ]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation

      f.inputs do
        f.has_many :admin_user_tabs, heading: 'Access Rights on Tabs', allow_destroy: true do |t|
          t.input :tab, include_blank: false
          t.input :access, label: 'Allowed Operation', as: :select, include_blank: false, collection: AdminUserTab::ALLOWED_OPERATIONS
        end
      end

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
