class Userparam < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :user

	validates :name, length: { minimum: 3 }, presence: true, uniqueness: true	
  validates :facebook_url, uniqueness: true
  validates :facebook_url, url: true
end
