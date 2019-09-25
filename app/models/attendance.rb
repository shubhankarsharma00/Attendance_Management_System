class Attendance < ApplicationRecord
	belongs_to :students, optional: true
	belongs_to :courses, optional: true
end
