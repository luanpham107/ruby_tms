class Subject < ApplicationRecord
  # Author of Subject
  belongs_to :user

  has_many :course_details, dependent: :destroy
  has_many :courses, through: :course_details

  # Relation between Task and User
  has_many :tasks, dependent: :destroy

  # validates:
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: Settings.subject_form.duration.min}
end
