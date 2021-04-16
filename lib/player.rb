class Player
  attr_reader :name, :hit_points
  BASE_HP = 60
  def initialize(name, hit_points = BASE_HP)
    @name = name 
    @hit_points = hit_points
  end

  def receive_damage(damage)
    @hit_points -= damage
  end
end 