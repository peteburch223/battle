require 'sinatra/base'
require 'sinatra'
require './lib/player'

class Battle < Sinatra::Base
  MAX_HP = 60

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $user_1 = Player.new(name:params[:user_1])
    $user_2 = Player.new(name:params[:user_2])
    $game = Game.new
    redirect '/play'
  end

  get '/play' do
    @user_1 = $user_1
    @user_2 = $user_2
    erb(:play)
  end

  get '/attack' do
    $game.attack($user_2)
    @user_1 = $user_1
    @user_2 = $user_2

    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
