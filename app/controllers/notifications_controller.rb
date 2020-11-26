class NotificationsController < ApplicationController
  prepend_before_action :notifications_seen, only: [:index, :show]

  def index
    @notifications = Notification.all
  end

  def show
    @notification = Notification.find(params[:id])
  end

  private

  def notifications_seen
    session[:notifications_last_seen] = Time.now
  end

  def notification_params
    params.require(:notification).permit(:title, :description)
  end
end
