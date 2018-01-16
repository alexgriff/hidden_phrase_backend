class MessageSerializer
  attr_reader :object

  def initialize(message)
    @object = message
  end

  def serialize
    {
      id: object.id,
      text: object.text,
      user: object.user.username
    }
  end
end
