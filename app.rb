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
    player1 = Player.new(name:params[:player_1])
    player2 = Player.new(name:params[:player_2])
    $game = Game.new(player1:player1, player2:player2)
    redirect '/play'
  end

  get '/play' do
    @player1 = $game.player1
    @player2 = $game.player2
    erb(:play)
  end

  get '/attack' do
    $game.attack($player2)
    @player1 = $game.player1
    @player2 = $game.player2

    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
