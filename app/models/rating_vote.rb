class RatingVote < ApplicationRecord
	belongs_to :user
	belongs_to :rating
end
