class CluesController < ApplicationController

  def create
    clue = Clue.new(clue_params.merge({user_id: current_user.id}))
    if clue.save
      game = Game.find_by(id: params[:game_id])
      GamesChannel.broadcast_to(game, {
        type: 'NEW_CLUE',
        payload: ClueSerializer.new(clue).serialize
      })
      render json: clue
    else
      render json: {errors: clue.errros}, status: 422
    end
  end


  private

  def clue_params
    params.permit(:word, :number, :game_id)
  end
end
