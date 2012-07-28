class Wave8 < Wave
  @@waves << self
  
  Min = 21700
  Max = 27700
  
  def generate_enemies    
    q = EnemyChaser.new(@game, 520, -40, {
      hit_points: 80.0,
      speed: 1.2,
      points: 120.0,
      shoot_bullet: true
    })
    @game.enemies << q
    q = nil
    
    2.times do |k|
      x = -50 - 100*k
      
      3.times do |i|
        y = 200 + 200*i
        
        q = EnemyMother.new(@game, x, y, {
          hit_points: 300.0,
          speed: 0.8,
          points: 200,
          enemy_kid: {
            hit_points: 3.5,
            speed: 3.0,
            points: 1
          }
        })
        @game.enemies << q
        q = nil
      end
    end
  end
end
