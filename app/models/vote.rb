class Vote < ApplicationRecord
	belongs_to :user
	#string resource_type = "Rating"|"IncitutionComment"| "RatingComment" object.class.name
	#integer resource_id = object.id
end
