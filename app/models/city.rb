class City < ApplicationRecord
	has_many :areas
	has_many :companies, through: :areas
	#has_many :companies
	#has_and_belongs_to_many :areas
end
