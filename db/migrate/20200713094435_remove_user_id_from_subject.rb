class RemoveUserIdFromSubject < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :user_id, :integer
  end
end
