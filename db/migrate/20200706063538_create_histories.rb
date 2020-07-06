class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer :percent
      t.integer :status
      t.references :process_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
