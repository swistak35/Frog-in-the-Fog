class Wave8 < Wave
  @@waves << self
  
  Min = 21700
  Max = 27700
  
  def generate_enemies    
    @game.enemies << EnemyChaser.new(@game, 520, -40, {
      hit_points: 60.0,
      speed: 1.2,
      points: 120.0,
      shoot_bullet: true
    })
    
    2.times do |k|
      x = -50 - 100*k
      
      3.times do |i|
        y = 200 + 200*i
        
        @game.enemies << EnemyMother.new(@game, x, y, {
          hit_points: 130,
          speed: 0.9,
          points: 200,
          enemy_kid: {
            hit_points: 2,
            speed: 2.0,
            points: 1
          }
        })
      end
    end
  end
end
