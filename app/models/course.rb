class Course < ApplicationRecord
	has_many :attendances, through: :attendances
	belongs_to :teacher 
	belongs_to :subject 
end
