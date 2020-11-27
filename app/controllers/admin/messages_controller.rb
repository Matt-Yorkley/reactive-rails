module Admin
  class MessagesController < Admin::BaseController
    def index
      @messages = Message.sender_or_receiver(params[:id]).includes(:sender)
      @user = User.find(params[:id])
    end

    def create
      @message = Message.new(message_params)
      @message.sender_id = current_user.id

      if @message.save
        redirect_to admin_messages_path(params[:id]), notice: 'Message was successfully created.'
      else
        redirect_to admin_messages_path(params[:id]), alert: 'Message validation failed.'
      end
    end

    private

    def user_id
      params[:id]
    end

    def message_params
      params.require(:message).permit(:content, :receiver_id)
    end
  end
end
