class WorkTime < ApplicationRecord
	belongs_to :institution

	validates_format_of :mondeyStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

end
