class GameSerializer
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def small_serialize
    {
      id: object.id,
      status: object.status,
      name: object.game_cards.order(:index).first(2).map { |gc| gc.card.word }.join(' '),
      players: object.players.pluck(:username),
      creator: object.creator
    }
  end


  def serialize
    {
      id: object.id,
      clue: ClueSerializer.new(object.current_clue).serialize,
      players: object.game_players.map { |gp| GamePlayersSerializer.new(gp).serialize},
      cards: object.game_cards.order(:index).map { |card| GameCardSerializer.new(card).serialize },
      messages: object.messages.map { |msg| MessageSerializer.new(msg).serialize }
    }
  end
end
