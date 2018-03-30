class WorkTime < ApplicationRecord
	belongs_to :institution

	validates_format_of :mondayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

      validates_format_of :tuesdayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

      validates_format_of :wednesdayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

      validates_format_of :thursdayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/


      validates_format_of :fridayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

      validates_format_of :saturdayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

       validates_format_of :sundayStart, 
     lendth: { in: 5 },
      :with => /\(?[0-9]{2}\)?:[0-9]{2}/

end
