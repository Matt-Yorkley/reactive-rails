class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :configure_devise_parameters, if: :devise_controller?

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
