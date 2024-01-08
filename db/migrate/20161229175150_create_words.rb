class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :text, null: false
      t.string :ordered, null: false
      t.integer :length, null: false
      t.string :jumble, null: false

      t.timestamps null: false
    end

    add_index(:words, :length)
    add_index(:words, :ordered)
  end
end
