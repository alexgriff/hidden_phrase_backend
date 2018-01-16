Rails.application.routes.draw do
  resources :games, only: [:show, :create, :index]
  resources :users, only: [:create]
  resources :game_players, only: [:create]
  resources :game_cards, only: [:update]
  resources :clues, only: [:create]
  resources :messages, only: [:create]

  post '/login', to: 'authentication#create'
  get '/current_user', to: 'authentication#show'

  mount ActionCable.server => '/cable'
end
