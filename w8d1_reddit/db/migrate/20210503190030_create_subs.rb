class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :description
      t.integer :moderator
      t.timestamps
    end
  end
end
