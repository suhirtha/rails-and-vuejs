class Company < ApplicationRecord
	has_and_belongs_to_many :areas
	accepts_nested_attributes_for :areas
	
	has_many :cities, through: :areas 
	accepts_nested_attributes_for :cities
	
	has_many :rates 
	accepts_nested_attributes_for :rates

	has_many :types, through: :rates
	accepts_nested_attributes_for :types
	
	#has_many :cities
	#has_many :areas
	
end
