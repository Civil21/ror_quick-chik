class InstitutionCommentVote < ApplicationRecord
	belongs_to :user
	belongs_to :institution_comment
end
