class Player < ApplicationRecord
	has_many	:games
	
	scope :opponents, ->(player) { where.not(id: player) }
end
