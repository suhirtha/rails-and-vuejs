class Type < ApplicationRecord
	has_many :rates
	has_many :companies, through: :rates
end
