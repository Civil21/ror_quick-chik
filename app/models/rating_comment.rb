class RatingComment < ApplicationRecord
	belongs_to :rating
	belongs_to :user
	
	#validates :text , length: { in: 10..300 }
end
