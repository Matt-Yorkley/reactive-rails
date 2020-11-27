class MessagesController < ApplicationController
  prepend_before_action :messages_seen, only: :index

  def index
    @messages = Message.sender_or_receiver(current_user).includes(:sender)
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id

    if @message.save
      redirect_to user_messages_path(user_id), notice: 'Message was successfully created.'
    else
      redirect_to user_messages_path(user_id)
    end
  end

  private

  def user_id
    params[:user_id]
  end

  def messages_seen
    session[:messages_last_seen] = Time.now
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
