class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :session_token
      t.string :password_digest
      t.timestamps
    end
    add_index :users, :session_token
  end
end
