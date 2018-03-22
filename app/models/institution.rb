class Institution < ApplicationRecord
   mount_uploaders :images, ImageUploader
  	serialize :images, JSON
   has_and_belongs_to_many :category
   has_one :work_time
end
