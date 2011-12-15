class Wave5Circle < Wave
  @@waves << self
  
  Min = 7600
  Max = 11350
  
  def generate_enemies
    3.times do |k|
      x = 190 + 300*k
      
      10.times do |i|
        y = -40 - i*40
        d = (i % 2 == 0 ? :right : :left)
        
        @game.enemies << EnemyCircle.new(@game, x, y, {
          hit_points: 35.0,
          speed: 2.0,
          points: 125.0,
          direction: d,
          speed_2: 3.0
        })
      end
    end
  end
end
