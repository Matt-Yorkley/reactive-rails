class MessagesController < ApplicationController
  prepend_before_action :messages_seen, only: :index

  def index
    @messages = Message.sender_or_receiver(current_user).includes(:sender)
  end

  private

  def user_id
    params[:user_id]
  end

  def messages_seen
    session[:messages_last_seen] = Time.now
  end
end
