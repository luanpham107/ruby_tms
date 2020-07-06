class History < ApplicationRecord
  enum status: {start: 0, in_processing: 1, finished: 2}
  belongs_to :process_task
end
