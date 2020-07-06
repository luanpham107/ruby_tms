class CourseDetail < ApplicationRecord
  belongs_to :course
  belongs_to :subject
end
