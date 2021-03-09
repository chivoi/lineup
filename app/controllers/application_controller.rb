class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_sanitized_params, if: :devise_controller?

  def configure_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, profile_attributes: [:name, :playtime, :musictype_id, :demolinks, :location, :teamups, :bio, style_ids: []])
    end
  end

end
