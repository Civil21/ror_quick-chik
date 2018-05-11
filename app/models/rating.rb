class Rating < ApplicationRecord
	belongs_to :institution
	belongs_to :user
	
	has_many :rating_comments

	#validates :text , length: { in: 10..300 }
end
