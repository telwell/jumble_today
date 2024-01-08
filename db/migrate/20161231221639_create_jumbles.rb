class CreateJumbles < ActiveRecord::Migration[6.0]
  def change
    create_table :jumbles do |t|
    
      t.timestamps null: false
    end
  end
end
