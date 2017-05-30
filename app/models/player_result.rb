class PlayerResult < ApplicationRecord
	belongs_to :player, class_name: "Player", foreign_key: "playerid"
	belongs_to :game, class_name: "Game", foreign_key: "gameid"

	belongs_to :teammate, class_name: "Player", foreign_key: "teammate", optional: true
	belongs_to :opponent, class_name: "Player", foreign_key: "opponent", optional: true

	validates :game, presence: true
	scope :most_recent_first, -> { order created_at: :desc }
	scope :for_game, -> (game) { where(game: game) }
	scope :against, -> (player) { where(opponent: player) }
	scope :games_played, -> { distinct.pluck(:gameid).count }
	scope :wins, -> {where(won: true).games_played}
	scope :losses, -> {where(won: false).games_played}
	scope :team_with, -> (player) {where(teammate: player)}

	def percent_of(n)
    	self.to_f / n.to_f * 100.0
  	end
end
