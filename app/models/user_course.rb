class UserCourse < ApplicationRecord
  enum roles: {owner: 0, trainer: 1, trainee: 2}
  belongs_to :user
  belongs_to :course
end
