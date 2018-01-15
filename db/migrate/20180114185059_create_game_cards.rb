class CreateGameCards < ActiveRecord::Migration[5.1]
  def change
    create_table :game_cards do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :card, foreign_key: true
      t.integer :index
      t.integer :identity
      t.boolean :known, default: false

      t.timestamps
    end
  end
end
