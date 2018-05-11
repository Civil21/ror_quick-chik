class WorkTime < ApplicationRecord
	belongs_to :institution

	validates_format_of :mondayStart, 
		allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :tuesdayStart, 
    	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :wednesdayStart,
      	allow_blank: true, 
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :thursdayStart, 
    	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/


    validates_format_of :fridayStart, 
      	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :saturdayStart, 
      	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :sundayStart, 
       	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

	validates_format_of :mondayEnd, 
		allow_blank: true,
    	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :tuesdayEnd, 
    	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :wednesdayEnd, 
      	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :thursdayEnd, 
      	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/


    validates_format_of :fridayEnd, 
      	allow_blank: true,
     	lendth: { in: 5 },
      	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :saturdayEnd, 
      	allow_blank: true,
     	lendth: { in: 5 },
    	:with => /\(?[0-9]{2}\)?:[0-9]{2}/

    validates_format_of :sundayEnd, 
       	allow_blank: true,
     	lendth: { in: 5 },
		:with => /\(?[0-9]{2}\)?:[0-9]{2}/

end
