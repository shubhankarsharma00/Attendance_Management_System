class Subject < ApplicationRecord
	has_many :courses, dependent: :destroy
	has_many :teacher, through: :courses
end
