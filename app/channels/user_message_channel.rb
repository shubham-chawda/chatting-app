class UserMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_message_channel_#{params[:user_message_id]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
