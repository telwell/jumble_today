class CreateJumbleWords < ActiveRecord::Migration[6.0]
  def change
    create_table :jumble_words do |t|
      t.belongs_to :jumble, index: true
      t.belongs_to :word, index: true
      
      t.timestamps null: false
    end
  end
end
