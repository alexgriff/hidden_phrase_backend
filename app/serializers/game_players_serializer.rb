class GamePlayersSerializer
  attr_reader :object

  def initialize(game_player)
    @object = game_player
  end

  def serialize
    player = object.user

    {
      role: object.role,
      username: player.username,
      id: player.id
    }
  end
end
