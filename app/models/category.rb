class Category < ApplicationRecord
	has_and_belongs_to_many :institution

	validates :name, length: { minimum: 3 }, presence: true, uniqueness: true
end
