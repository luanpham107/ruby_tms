class Task < ApplicationRecord
  belongs_to :subject

  has_many :process_tasks, dependent: :destroy
  has_many :users, through: :process_tasks

  validates :name, presence: true
  validates :description, presence: true

  scope :sort_by_name, ->{order :name}
end
