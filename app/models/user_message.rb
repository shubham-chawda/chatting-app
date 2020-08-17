class UserMessage < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_commit :create_notifications, on: :create

  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'private'
      notification.actor = self.user
      notification.user_id =  self.conversation.recipient.id
      notification.target = self
    end
  end
end
