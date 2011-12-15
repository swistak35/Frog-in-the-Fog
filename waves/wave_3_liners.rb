class Wave3Liners < Wave
  @@waves << self
  
  Min = 1950
  Max = 4200
  
  def generate_enemies
    4.times do |k|
      y = -40 - 60*k
      
      10.times do |i|
        x = 51 + i*102
        @game.enemies << EnemyLiner.new(@game, x, y, {
          hit_points: 5.0,
          speed: 0.8,
          points: 56.0
        })
      end
    end
  end
end
