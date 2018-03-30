class Institution < ApplicationRecord
   mount_uploaders :images, ImageUploader
  	serialize :images, JSON
   has_and_belongs_to_many :category
   has_one :work_time
   has_many :ratings
   has_many :institution_comments

   validates :name, length: { minimum: 3 }, presence: true, uniqueness: true
   validates :description, length: { in: 10..300 }
   validates_format_of :phoneNumber, 
     lendth: { in: 12 },
      :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/
end
