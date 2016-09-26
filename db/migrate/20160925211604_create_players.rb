class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :score
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
