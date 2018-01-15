class GamePlayersController < ApplicationController

  def create
    game_player = GamePlayer.new(game_player_params.merge({user_id: current_user.id}))

    if game_player.save
      render json: GamePlayersSerializer.new(game_player).serialize
    else
      render json: {errors: game_player.errors}, status: 422
    end
  end

  private

  def game_player_params
    params.permit(:role, :game_id)
  end

end
