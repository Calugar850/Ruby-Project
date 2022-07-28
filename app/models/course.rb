class Course < ApplicationRecord
  belongs_to :school
  has_many :enrolments
  has_many :users, through: :enrolments
  has_many :chapters
end
