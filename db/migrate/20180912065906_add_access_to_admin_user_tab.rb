class AddAccessToAdminUserTab < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_user_tabs, :access, :string, default: "Read"
  end
end
