class Tab < ApplicationRecord
  has_many :admin_user_tabs
  has_many :admin_users, :through => :admin_user_tabs
end
