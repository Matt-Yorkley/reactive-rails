module Admin
  class MessagesController < Admin::BaseController
    def index
      @messages = Message.sender_or_receiver(user_id).includes(:sender)
      @user = User.find(user_id)
    end

    private

    def user_id
      params[:id]
    end
  end
end
