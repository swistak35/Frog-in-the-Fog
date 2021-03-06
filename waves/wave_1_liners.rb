class Wave1Liners < Wave
  @@waves << self
  
  Min = 200
  Max = 800
  
  def generate_enemies
    10.times do |i|
      x = 51 + i*102
      q = EnemyLiner.new(@game, x, -40, {
        hit_points: 14.0,
        speed: 0.65,
        points: 75.0
      })
      @game.enemies << q
      q = nil
    end
  end
end
