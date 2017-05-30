class AddPlayersToGame < ActiveRecord::Migration[5.1]
  def change
  	add_column :games, :white_team_first_player, :integer
  	add_column :games, :white_team_second_player, :integer
  	add_column :games, :black_team_first_player, :integer
  	add_column :games, :black_team_second_player, :integer
  	add_column :games, :result, :integer # 0 - none, 1 - white, 2 - black
  end
end
