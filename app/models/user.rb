class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :email, presence: true

  has_many :contents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chat_room_users, dependent: :destroy
  has_many :chat_rooms, { through: :chat_room_users }
  has_many :chat_messages, dependent: :destroy
  has_many :hearts, dependent: :destroy

  attachment :image

  def favorited_by?(content)
    self.favorites.where(content_id: content.id).exists?
  end
end

