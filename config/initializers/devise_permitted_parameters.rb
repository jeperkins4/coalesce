module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:time_zone, :name, :email, :phone, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:time_zone, :name, :email, :franchise_id, :phone, :password, :password_confirmation, :current_password) }
  end

end

DeviseController.send :include, DevisePermittedParameters
