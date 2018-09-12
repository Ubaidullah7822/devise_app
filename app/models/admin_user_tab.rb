class AdminUserTab < ApplicationRecord
  belongs_to :admin_user
  belongs_to :tab

  ALLOWED_OPERATIONS = ['Read', 'Read/Write']

  validates :access, inclusion: { in: ALLOWED_OPERATIONS, message: "%{value} is not a valid operation" }
end
