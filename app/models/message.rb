class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_commit :create_notifications, on: :create

  private

  def create_notifications
    self.room.user_ids.uniq.each do |id|
      Notification.create do |notification|
        notification.notify_type = 'message'
        notification.actor = self.user
        notification.user_id = id
        notification.target = self
      end
    end
  end
end
