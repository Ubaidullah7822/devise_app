class DropAdminUserTabs < ActiveRecord::Migration[5.2]
  def change
    drop_table :admin_user_tabs do |t|
      t.references :admin_users, foreign_key: true
      t.references :tabs, foreign_key: true

      t.timestamps
      end
  end
end
