class Area < ApplicationRecord
	belongs_to :city
	has_and_belongs_to_many :companies
	#has_and_belongs_to_many :areas
	#belongs_to :company

	
end
