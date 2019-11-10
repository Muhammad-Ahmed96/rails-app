class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :cnic, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob, :cnic, :role])
  end

  def after_sign_up_path_for(resource)
    byebug
    new_user_session_path
  end

  def is_admin
    if current_user.present?
      if current_user.role == "admin"
        return true
      else
        flash[:alert] = "Only admin can perform this action"
        return false
      end
    else
      return false
    end
  end


end
