class User < ApplicationRecord
  has_secure_password
  has_many :game_players
  has_many :games, through: :game_players
  has_many :clues
  has_many :messages
  
  validates :username, uniqueness: true, presence: true
end
