class EditUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :goal_id, :integer
    add_index :users, :goal_id
  end
end
