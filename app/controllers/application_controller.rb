class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_notifications, :set_messages, if: -> { user_signed_in? && !admin_controller? }

  protected

  def set_notifications
    @latest_notifications = Notification.latest
    @notifications_status = new_notifications? ? 'active' : ''
  end

  def new_notifications?
    session[:notifications_last_seen].to_i < Notification.maximum(:created_at).to_i
  end

  def set_messages
    @latest_messages = Message.receiver(current_user).latest
    @messages_status = ''
  end

  def new_messages?
    session[:messages_last_seen].to_i < Message.maximum(:created_at).to_i
  end

  def admin_controller?
    false
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
