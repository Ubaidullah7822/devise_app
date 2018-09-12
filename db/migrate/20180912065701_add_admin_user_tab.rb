class AddAdminUserTab < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_user_tabs do |t|
      t.references :admin_user, foreign_key: true
      t.references :tab, foreign_key: true

      t.timestamps
    end
  end
end
