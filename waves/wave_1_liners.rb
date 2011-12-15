class Wave1Liners < Wave
  @@waves << self
  
  Min = 200
  Max = 800
  
  def generate_enemies
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyLiner.new(@game, x, -40, {
        hit_points: 11.0,
        speed: 0.6,
        points: 75.0
      })
    end
  end
end
