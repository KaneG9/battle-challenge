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
    Game.new(Player.new(params[:name_one]), Player.new(params[:name_two])).save_game
    redirect '/play'
  end 

  get '/play' do
    @game = Game.load_game
    erb :play
  end 

  get '/attack' do
    @game = Game.load_game
    @game.attack
    redirect '/game_over' if @game.over?
    erb :attack
  end

  post '/change_turns' do
    Game.load_game.change_turn
    redirect '/play'
  end

  get '/game_over' do
    @game = Game.load_game
    erb :game_over
  end

  run! if app_file == $0
end