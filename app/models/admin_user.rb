class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :admin_user_tabs
  has_many :tabs, :through => :admin_user_tabs

  accepts_nested_attributes_for :admin_user_tabs, allow_destroy: true
  accepts_nested_attributes_for :tabs, allow_destroy: true

  def show_tab?(tabe_name)
    tabs.find_by_name(tabe_name).present?
  end

  def write_allowed?(tabe_name)
    tabs.includes(:admin_user_tabs).where(name: tabe_name, admin_user_tabs: { access: 'Read/Write' }).present?
  end
end
