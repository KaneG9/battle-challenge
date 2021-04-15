require_relative 'player'

class Game
  attr_reader :player_one, :player_two, :turn_player_one

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @turn_player_one = true
  end

  def attack
    !@turn_player_one ? player = @player_one : player = @player_two
    player.receive_damage
    change_turn
  end

private
  def change_turn
    @turn_player_one = !@turn_player_one
  end
end