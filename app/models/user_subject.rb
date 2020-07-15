class UserSubject < ApplicationRecord
  enum status: {pending: 0, open: 1, finished: 2}
  belongs_to :user
  belongs_to :subject

  scope :check_exist, ->(user_id){where user_id: user_id}
end
