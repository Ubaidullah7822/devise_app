class ApplicationController < ActionController::Base
  # Inside your protected controller
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    added_attrs = [:user_type, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # def after_sign_in_path_for(users)
  #   if current_user.admin?
  #     puts "--------Admin"
  #     admin_root_path
  #   else
  #     puts "--------User"
  #   logged_in_home_path
  #   end
  # end
  # def after_sign_up_path(users)
  #   signed_up_home_path
  # end
  # def after_sign_out_path_for(users)
  #   logged_out_home_path
  # end

end
