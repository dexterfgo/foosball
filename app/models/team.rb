class Team < ApplicationRecord
  has_and_belongs_to_many :players
  # belongs_to :result

  # validates :rank, presence: true

  # scope :winners, -> {
  #   where(:rank => FIRST_PLACE_RANK)
  # }

  # scope :losers, -> {
  #   where.not(:rank => FIRST_PLACE_RANK)
  # }
end
