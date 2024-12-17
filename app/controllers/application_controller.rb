class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    # Configuring the username field to be permitted for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
  end
end
