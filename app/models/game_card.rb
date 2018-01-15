class GameCard < ApplicationRecord
  belongs_to :game
  belongs_to :card

  enum identity: [:blue_spy, :red_spy, :innocent_bystander, :assassin]
end
