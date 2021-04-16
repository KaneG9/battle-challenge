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
    redirect '/game_over' if @game.over
    erb :attack
  end

  post '/change_turns' do
    $game.change_turn
    redirect '/play'
  end

  get '/game_over' do
    @game = $game
    erb :game_over
  end

  run! if app_file == $0
end