class Company < ApplicationRecord
	has_and_belongs_to_many :areas
	has_many :cities, through: :areas
	has_many :rates
	has_many :types, through: :rates
	#has_many :cities
	#has_many :areas
	
end
