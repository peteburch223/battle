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
    # player2 = params[:player_2]
    session[:me] = player1
    #p session

    if Game.current_game.nil?
      Game.create(player_name: player1, player_class:Player)
    else
      Game.current_game.add_player(player_name: player1)
      Game.current_game.start_game
    end
    redirect '/wait'
  end

  get '/wait' do
    @player = session[:me]
    erb(:wait)
  end


  before do
    @game = Game.current_game
  end


  post '/check' do
    if @game.players.count == Game::MAX_PLAYERS
      redirect '/play'
    else
      redirect '/wait'
    end
  end


  get '/play' do
    puts "you got to play"
    erb(:play)
  end

  post '/attack' do
    #p session
    # identify opponent - player who is not me
    opponent = @game.find_opponent_of(session[:me])
    @game.attack(opponent)
    #@game.opponent.hp.zero? ? erb(:lose): erb(:attack)
    redirect '/play'
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
