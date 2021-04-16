require_relative 'player'

class Game
  attr_reader :player_one, :player_two, :turn_player_one
  @game = nil
  
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @turn_player_one = true
  end

  def self.save_game(game)
    @game = game
  end

  def self.load_game
    @game
  end

  def attack
    damage = rand(10)
    self.defender.receive_damage(damage)
  end

  def attacker
    @turn_player_one ? @player_one : @player_two
  end

  def defender
    @turn_player_one ? @player_two : @player_one
  end

  def change_turn
    @turn_player_one = !@turn_player_one
  end

  def over? 
    self.defender.hit_points <= 0 
  end
end