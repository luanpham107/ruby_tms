class CreateProcessTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :process_tasks do |t|
      t.string :description
      t.integer :percent
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
