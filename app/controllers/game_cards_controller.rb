class GameCardsController < ApplicationController

  def update
    game_card = GameCard.find_by(id: params[:id])
    game_card.update(known: true)
    game = game_card.game

    GamesChannel.broadcast_to(game, {type: 'UPDATE_BOARD', payload: GameSerializer.new(game).serialize})

    render json: GameCardSerializer.new(game_card).serialize
  end

end
