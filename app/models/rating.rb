class Rating < ApplicationRecord
	belongs_to :institution
	belongs_to :user
	has_many :rating_comments
	has_many :rating_votes
end
