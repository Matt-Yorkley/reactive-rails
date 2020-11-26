module NotificationsHelper

  def notification_class(status)
    "is-link" if status == "active"
  end
end
