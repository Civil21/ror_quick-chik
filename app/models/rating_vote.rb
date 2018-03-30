class RatingVote < ApplicationRecord
	belongs_to :user
	belongs_to :rating
	validates :text , length: { in: 10..300 }, uniqueness: true
end
