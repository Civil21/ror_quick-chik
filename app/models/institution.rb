class Institution < ApplicationRecord
   mount_uploaders :images, ImageUploader
  serialize :images, JSON
end
