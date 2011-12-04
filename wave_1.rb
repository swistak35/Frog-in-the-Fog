class Wave1 < Wave
  @@waves << self
  
  Min = 200
  Max = 1000
  
  def generate_enemies
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyLiner.new(@game, x, -40, 10, 0.6, 35)
    end
  end
end
