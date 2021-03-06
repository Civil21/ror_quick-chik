class Institution < ApplicationRecord
   mount_uploaders :images, ImageUploader
  	serialize :images, JSON
    
  has_and_belongs_to_many :category
  has_one :work_time
  has_many :ratings
  has_many :institution_comments

  geocoded_by :address   # can also be an IP address
  after_validation :geocode,  :if => :address_changed?  # auto-fetch coordinates
  validates :address , presence: true, uniqueness: true
   validates :name, length: { minimum: 3 }, presence: true, uniqueness: true
   validates :description, length: { in: 10..300 }, allow_blank: true
   validates_format_of :phoneNumber,
      allow_blank: true,
      lendth: { in: 12 },
      with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/
end
