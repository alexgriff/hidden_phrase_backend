class GameSerializer
  attr_reader :object

  def initialize(object)
    @object = object
    serialize
  end


  def serialize

    {
      id: object.id,
      clue: ClueSerializer.new(object.current_clue).serialize,
      players: object.game_players.map { |gp| GamePlayersSerializer.new(gp).serialize},
      cards: object.game_cards.order(:index).map { |card| GameCardSerializer.new(card).serialize }
    }
  end
end
