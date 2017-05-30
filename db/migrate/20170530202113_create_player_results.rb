class CreatePlayerResults < ActiveRecord::Migration[5.1]
  def change
    create_table :player_results do |t|
      t.integer :gameid
      t.integer :playerid
      t.integer :teammate
      t.integer :team
      t.integer :opponent
      t.boolean :won

      t.timestamps
    end
  end
end
