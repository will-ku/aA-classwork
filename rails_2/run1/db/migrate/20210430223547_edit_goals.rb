class EditGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :user_id
  end
end
