class Subject < ApplicationRecord
  # Author of Subject
  belongs_to :user

  has_many :course_details, dependent: :destroy
  has_many :courses, through: :course_details

  # Relation between Task and User
  has_many :tasks, dependent: :destroy
end
