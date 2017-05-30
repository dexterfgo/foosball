class Game < ApplicationRecord
	default_scope { order("updated_at DESC") }

	belongs_to :white_team_first_player, class_name: "Player", foreign_key: "white_team_first_player"
	belongs_to :black_team_first_player, class_name: "Player", foreign_key: "black_team_first_player"
	belongs_to :white_team_second_player, class_name: "Player", foreign_key: "white_team_second_player", optional: true
	belongs_to :black_team_second_player, class_name: "Player", foreign_key: "black_team_second_player", optional: true

	has_many :player_results, dependent: :destroy

  	validates :white_team_first_player, presence: true
  	validates :black_team_first_player, presence: true
end
