class GameCardSerializer
  attr_reader :object

  def initialize(object)
    @object = object
    serialize
  end


  def serialize
    {
      id: object.id,
      word: object.card.word,
      index: object.index,
      identity: object.identity,
      known: object.known
    }
  end
end
