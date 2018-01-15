class ClueSerializer
  attr_reader :object

  def initialize(clue)
    @object = clue
  end

  def serialize
    if object
      {
        word: object.word,
        number: object.number
      }
    else
      {
        word: '',
        number: ''
      }
    end
  end
end
