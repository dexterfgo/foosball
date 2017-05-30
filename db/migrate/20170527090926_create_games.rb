class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :white_team
      t.integer :black_team
      t.string :game_title

      t.timestamps
    end
  end
end
