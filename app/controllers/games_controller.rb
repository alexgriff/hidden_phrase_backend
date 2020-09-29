class GamesController < ApplicationController
  def show
    game = Game.find_by(id: params[:id])
    render json: GameSerializer.new(game).serialize
  end

  def index
    render json: Game.where.not(status: :complete).order(created_at: :desc).map { |game| GameSerializer.new(game).small_serialize }
  end

  def create
    game = Game.create(creator_id: current_user.id, status: :waiting)
    GameInitializer.new(game)
    ActionCable.server.broadcast('lobby_channel', {
      type: 'NEW_GAME',
      payload: GameSerializer.new(game).small_serialize
    })

    render json: GameSerializer.new(game).small_serialize
  end
end
