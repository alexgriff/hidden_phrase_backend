class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :user

  enum role: [:blue_spy_master, :red_spy_master, :blue, :red]
  validate :one_spy_master, :one_role


  def one_spy_master
    if role.include?('spy_master')
      if game.game_players.find_by(role: self.role)
        errors.add(:role, 'one Spy Master per team')
      end
    end
  end

  def one_role
    if game.game_players.find_by(user_id: self.user_id)
      errors.add(:user_id, 'can only be in one role per game')
    end
  end

end
