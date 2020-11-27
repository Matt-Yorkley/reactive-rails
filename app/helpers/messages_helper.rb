module MessagesHelper
  def message_origin_class(message)
    if message.sender_id == current_user.id
      'sender'
    else
      'receiver'
    end
  end
end
