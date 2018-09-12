class AddAllowedPermissionInUserCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :user_courses, :access, :string, default: "Read"
  end
end
