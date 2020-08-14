class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  #for private chat
  has_many :user_messages
  has_many :conversations, foreign_key: :sender_id

  validates_uniqueness_of :username

end
