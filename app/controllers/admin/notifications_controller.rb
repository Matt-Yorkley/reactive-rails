module Admin
  class NotificationsController < Admin::BaseController
    before_action :set_notification, only: [:show, :edit, :update, :destroy]

    def index
      @notifications = Notification.all
      @notification = Notification.new
    end

    def show
    end

    def new
      @notification = Notification.new
    end

    def edit
    end

    def create
      @notification = Notification.new(notification_params)

      respond_to do |format|
        if @notification.save
          format.html { redirect_to admin_notifications_path, notice: 'Notification was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @notification.update(notification_params)
          format.html { redirect_to admin_notifications_path, notice: 'Notification was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @notification.destroy
      respond_to do |format|
        format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      end
    end

    private

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description)
    end
  end
end
