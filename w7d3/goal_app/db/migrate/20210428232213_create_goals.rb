class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.text :title, null: false
      t.integer :user_id, null: false
      t.boolean :private, null: false
    end
    add_index :goals, :user_id
  end
end
