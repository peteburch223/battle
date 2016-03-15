require 'sinatra/base'
require 'sinatra'


get '/' do
  'Hello Battle World!!'
end

# class Battle < Sinatra::Base
#   get '/' do
#     'Hello Battle World!!'
#   end
#
#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end
