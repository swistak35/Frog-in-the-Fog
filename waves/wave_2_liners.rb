class Wave2Liners < Wave
  @@waves << self
  
  Min = 1000
  Max = 1750
  
  def generate_enemies
    2.times do |k|
      y = -40 - 60*k
      
      10.times do |i|
        x = 51 + i*102
        
        q = EnemyLiner.new(@game, x, y, {
          hit_points: 10.0,
          speed: 0.8,
          points: 75.0
        })
        @game.enemies << q
        q = nil
      end
    end
  end
end
