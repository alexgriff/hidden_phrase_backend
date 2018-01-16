class Game < ApplicationRecord
  has_many :game_cards
  has_many :cards, through: :game_cards
  has_many :clues
  has_many :game_players
  has_many :players, through: :game_players, source: :user
  has_many :messages
  belongs_to :creator, class_name: 'User'

  enum status: [:waiting, :in_progress, :complete]

  def current_clue
    self.clues.order(updated_at: :desc).first
  end

  def blue_spies
   self.game_cards.where(identity: :blue_spy).pluck(:index)
  end

  def red_spies
   self.game_cards.where(identity: :red_spy).pluck(:index)
  end

  def innocent_bystanders
   self.game_cards.where(identity: :innocent_bystander  ).pluck(:index)
  end

  def assassin
   self.game_cards.find_by(identity: :assassin).index
  end
end
