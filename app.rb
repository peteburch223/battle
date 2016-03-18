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
    session[:me] = player1
    #p session
    Game.create(player1_name: player1, player2_name: player2, player_class:Player)
    redirect '/play'
  end

  before do
    @game = Game.current_game
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    #p session
    # identify opponent - player who is not me

    @game.attack(@game.opponent)
    @game.opponent.hp.zero? ? erb(:lose): erb(:attack)
    #redirect '/play'
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
