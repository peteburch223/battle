require 'sinatra/base'
require 'sinatra'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:user_1] = params[:user_1]
    session[:user_2] = params[:user_2]
    redirect '/play'
  end

  get '/play' do
    @user_1 = session[:user_1]
    @user_2 = session[:user_2]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
