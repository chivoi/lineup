class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sanitized_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {
        redirect_to root_path, alert: exception.message
      }
    end
  end

  def configure_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, profile_attributes: [:name, :playtime, :musictype_id, :demolinks, :location, :teamups, :bio, style_ids: []])
    end
  end
end
