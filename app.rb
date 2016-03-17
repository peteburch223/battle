require 'sinatra/base'
require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base


  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = params[:player_1]
    player2 = params[:player_2]
    Game.create(player1_name: player1, player2_name: player2, player_class:Player)
    redirect '/play'
  end

  before do
    @game = Game.current_game
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.opponent)
    @game.opponent.hp==0 ? erb(:lose): erb(:attack)
  end

  post '/switch' do
    @game.switch
    redirect '/play'
  end

  post '/lose' do
    @game.restart
    redirect '/play'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
