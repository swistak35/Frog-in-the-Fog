class Wave9Chasers < Wave
  @@waves << self
  
  Min = 27900
  Max = 34650
  
  def generate_enemies
    5.times do |i|
      x = 101 + i*200
      
      q = EnemyChaser.new(@game, x, -40, {
        hit_points: 110.0,
        speed: 1.35,
        points: 150.0,
        shoot_bullet: true,
        bullet_reload: 400
      })
      @game.enemies << q
      q = nil
    end
  end
end
