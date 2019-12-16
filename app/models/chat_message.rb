class ChatMessage < ApplicationRecord

	belongs_to :chat_room
	belongs_to :user
	validates :message, presence: true

	scope :recent, -> { order(created_at: :desc)}

	#after_create_commit {MessageBroadcastJob.perform_later self}
end
