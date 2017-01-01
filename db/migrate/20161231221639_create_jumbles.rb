class CreateJumbles < ActiveRecord::Migration
  def change
    create_table :jumbles do |t|
    
      t.timestamps null: false
    end
  end
end
