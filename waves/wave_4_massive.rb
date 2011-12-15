class Wave4Massive < Wave
  @@waves << self
  
  Min = 4400
  Max = 7400
  
  def generate_enemies
    14.times do |k|
      y = -40 - 50*k
      
      10.times do |i|
        x = 51 + i*102
        @game.enemies << EnemyLiner.new(@game, x, y, {
          hit_points: 3.0,
          speed: 1.2,
          points: 21.0
        })
      end
    end
  end
end
