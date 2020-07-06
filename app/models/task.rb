class Task < ApplicationRecord
  belongs_to :subject

  has_many :process_tasks, dependent: :destroy
  has_many :users, through: :process_tasks
end
