class CreateUserJumbles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_jumbles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :jumble, index: true

      t.timestamps null: false
    end
  end
end
