class Content < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :reviews

	validates :title, presence: true
	validates :body, presence: true
end
