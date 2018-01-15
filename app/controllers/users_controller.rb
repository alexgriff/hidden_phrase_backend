class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({user_id: user.id}, ENV['secret_key'], 'HS256')
      }
    else
      render json: {errors: user.errors}, status: 422
    end
  end


  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end

end
