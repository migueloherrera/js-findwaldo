class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :posx
      t.integer :posy
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
