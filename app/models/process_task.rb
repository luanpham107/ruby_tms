class ProcessTask < ApplicationRecord
  enum status: {pending: 0, in_processing: 1, finished: 2}
  belongs_to :user
  belongs_to :task
  has_many :histories, dependent: :destroy
end
