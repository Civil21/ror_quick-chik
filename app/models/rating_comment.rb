class RatingComment < ApplicationRecord
	belongs_to :rating
	belongs_to :user
	has_many :rating_comment_votes
		validates :text , length: { in: 10..300 }
end
