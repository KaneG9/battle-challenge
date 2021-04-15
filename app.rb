require 'sinatra/base'
require 'sinatra/reloader' 
require './lib/player'
require './lib/game'


class Battle < Sinatra::Base
  #enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:name_one]), Player.new(params[:name_two]))
    redirect '/play'
  end 

  get '/play' do
    @game = $game
    erb :play
  end 

  get '/attack' do
    @game = $game
    @game.attack
    erb :attack
  end

  run! if app_file == $0
end