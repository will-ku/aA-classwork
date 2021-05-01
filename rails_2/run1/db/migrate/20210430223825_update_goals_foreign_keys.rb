class UpdateGoalsForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :goal_id
    add_column :goals, :user_id, :integer
    add_index :goals, :user_id
  end
end
