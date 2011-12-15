class Wave9Chasers < Wave
  @@waves << self
  
  Min = 27900
  Max = 34650
  
  def generate_enemies
    5.times do |i|
      x = 101 + i*200
      
      @game.enemies << EnemyChaser.new(@game, x, -40, {
        hit_points: 70.0,
        speed: 1.2,
        points: 150.0,
        shoot_bullet: true
      })
    end
  end
end
