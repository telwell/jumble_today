class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true
		change_column :users, :username, :string, null: false
  end
end
