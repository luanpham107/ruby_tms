class User < ApplicationRecord
  enum roles: {trainee: 0, trainer: 1}
  # Relation between User and Course
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses
  
  # Relation between User and Report
  has_many :reports, dependent: :destroy
  
  # Relation between User and process task
  has_many :process_tasks, dependent: :destroy
  has_many :tasks, through: :process_tasks
  
  # Relation between User and Subject
  has_many :subjects, dependent: :destroy
  has_secure_password
end
