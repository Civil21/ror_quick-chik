class InstitutionComment < ApplicationRecord
	belongs_to :user
	belongs_to :institution

	# validates :text , length: { in: 10..300 }
end
