require 'sinatra/base'
require 'sinatra'
require './lib/player'
require './lib/game'

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
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent)
    erb(:attack)
  end

  post '/switch'do
    $game.switch
    redirect '/play'    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
