class UserMessagesController < ApplicationController

  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @user_message = @conversation.user_messages.create(message_params)

    # PrivateMessageJob.perform_later(@user_message)
  end

  private

  def message_params
    params.require(:user_message).permit(:user_id, :body)
  end

end
