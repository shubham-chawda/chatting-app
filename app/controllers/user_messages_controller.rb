class UserMessagesController < ApplicationController

  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.user_messages.create(message_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:user_message).permit(:user_id, :body)
  end

end
