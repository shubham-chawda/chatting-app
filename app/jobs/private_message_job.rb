class PrivateMessageJob < ApplicationJob
  queue_as :default

  def perform(user_message)
    sending_file = ApplicationController.render(
      partial: 'user_messages/user_message',
      locals: { user_message: user_message }
    )

    ActionCable.server.broadcast "user_message_channel_#{user_message.id}", user_message: sending_file,   user_message: @user_message
  end

end
