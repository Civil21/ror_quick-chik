class RatingComment < ApplicationRecord
	belongs_to :rating
	belongs_to :user
end
