class GamesController < ApplicationController
  def show
    game = Game.find_by(id: params[:id])
    render json: GameSerializer.new(game).serialize
  end

  def index
    render json: Game.where.not(status: :complete)
  end

  def create
    game = Game.create(creator_id: current_user.id, status: :waiting)
    GameInitializer.new(game)
    redirect_to games_path
  end
end
