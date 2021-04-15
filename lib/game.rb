require_relative 'player'

class Game
  attr_reader :player_one, :player_two, :turn_player_one

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @turn_player_one = true
  end

  def attack
    self.defender.receive_damage
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
end