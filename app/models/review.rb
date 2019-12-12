class Review < ApplicationRecord
	belongs_to :user
	belongs_to :content

	validates :review_body, presence: true
end
