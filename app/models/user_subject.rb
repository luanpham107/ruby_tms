class UserSubject < ApplicationRecord
  enum status: {pending: 0, open: 1, finished: 2}
  belongs_to :user
  belongs_to :subject
end
