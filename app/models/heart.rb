class Heart < ApplicationRecord

	belongs_to :user

	validates :status, presence: true
	scope :recent, -> { order(created_at: :desc)}
end
