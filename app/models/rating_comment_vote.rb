class RatingCommentVote < ApplicationRecord
	belongs_to :user
	belongs_to :rating_comment
end
