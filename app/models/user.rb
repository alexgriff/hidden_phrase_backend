class User < ApplicationRecord
  has_secure_password
  has_many :game_players
  has_many :games, through: :game_players
  has_many :clues
  validates :username, uniqueness: true, presence: true
end
