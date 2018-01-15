class CreateClues < ActiveRecord::Migration[5.1]
  def change
    create_table :clues do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :game, foreign_key: true
      t.string :word
      t.integer :number

      t.timestamps
    end
  end
end
