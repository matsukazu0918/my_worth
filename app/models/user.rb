class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :email, presence: true

  has_many :contents
  has_many :favorites
  has_many :reviews
  has_many :chat_room_users
  has_many :chat_messages

  attachment :image

  def favorited_by?(content)
    self.favorites.where(content_id: content.id).exists?
  end
end

