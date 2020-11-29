# frozen_string_literal: true

class MessageReflex < ApplicationReflex
  def typing
    update_typing_feedback

    morph :nothing
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id

    if @message.save
      broadcast_new_message
      broadcast_messages_alert
      flash[:notification] = "Message was successfully created."
    else
      flash[:alert] = "Message sending failed."
    end

    update_typing_feedback("")
  end

  private

  def broadcast_new_message
    cable_ready["messages:user:#{receiver_id}"].insert_adjacent_html(
      selector: "#conversation",
      position: "afterbegin",
      html: render(
        partial: "shared/message", locals: { message: @message, message_origin: 'receiver' }
      )
    )
    cable_ready.broadcast
  end

  def broadcast_messages_alert
    messages = Message.receiver(receiver_id).latest

    cable_ready["messages:user:#{receiver_id}"].inner_html(
      selector: "#messages",
      html: render(
        partial: "shared/messages", locals: { messages: messages, status: 'active' }
      )
    )
    cable_ready.broadcast
  end

  def update_typing_feedback(html=nil)
    cable_ready["messages:user:#{receiver_id}"].inner_html(
      selector: "#typing",
      html: html || render_feedback
    )
    cable_ready.broadcast
  end

  def render_feedback
    return "" unless typing?

    render partial: "shared/typing", locals: { user: current_user }
  end

  def receiver_id
    params[:message][:receiver_id]
  end

  def typing?
    params[:message][:content].present?
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
