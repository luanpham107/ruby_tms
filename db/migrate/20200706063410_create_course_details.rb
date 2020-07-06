class CreateCourseDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :course_details do |t|
      t.integer :status, default: 0
      t.references :course, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
