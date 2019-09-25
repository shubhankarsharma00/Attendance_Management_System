class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :attendances, through: :attendances
  has_one :student_name, through: :student_names
  has_many :learnings, through: :learnings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
