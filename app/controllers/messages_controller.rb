class MessagesController < ApplicationController

  def create
    message = Message.create(message_params.merge(user_id: current_user.id))

    GamesChannel.broadcast_to(message.game, {
      type: 'NEW_MESSAGE',
      payload: MessageSerializer.new(message).serialize
    })
    render json: MessageSerializer.new(message).serialize
  end

  private

  def message_params
    params.permit(:text, :game_id)
  end
end
