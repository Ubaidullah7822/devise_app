class ApplicationController < ActionController::Base
  # Inside your protected controller
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :only => [:create,:update,:new]

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
