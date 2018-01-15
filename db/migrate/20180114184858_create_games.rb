class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :status
      t.integer :creator_id

      t.timestamps
    end
  end
end
