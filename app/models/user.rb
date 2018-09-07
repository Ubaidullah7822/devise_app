class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,password_length: 6..10
  has_many :user_courses
  has_many :courses, :through => :user_courses
  # attr_writer :login
  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  validates :user_type, presence:true

  scope :teacher, -> { where(:user_type => "Teacher") }
  # Only allow letter, number, underscore and punctuation.
  #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # def login
  #   @login || self.username || self.email
  # end

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #       where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.to_hash?(:username) || conditions.has_key?(:email)
  #       where(conditions.to_hash).first
  #   end

  # end
end
