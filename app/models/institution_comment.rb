class InstitutionComment < ApplicationRecord
	belongs_to :user
	belongs_to :institution
	has_many :institution_comment_votes
end
