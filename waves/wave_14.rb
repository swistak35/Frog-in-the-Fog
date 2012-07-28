class Wave14 < Wave
  @@waves << self
  
  Min = 70150
  Max = 80650
  
  def generate_enemies
    59.times do |i|
      x = -40 - 58*i
      q = EnemyPath.new(@game, x, 10.0, {
        hit_points: 40.0,
        speed: 4.0,
        points: 50.0,
        path: [
          [10.0, 10.0],
          [1010.0, 10.0],
          [1010.0, 730.0],
          [10.0, 730.0]
        ]
      })
      @game.enemies << q
      q = nil
    end
    
    q = EnemyChaser.new(@game, 520, -40, {
      hit_points: 200.0,
      speed: 1.8,
      points: 350.0,
      shoot_rocket: true,
      shoot_bullet: true,
      bullet_reload: 250
    })
    @game.enemies << q
    q = nil
    
    [10.0, 730.0].each do |y|
      q = EnemyMother.new(@game, -40, y, {
        hit_points: 700,
        speed: 0.7,
        points: 270,
        reload: 7500,
        amount: 5,
        enemy_kid: {
          hit_points: 3.0,
          speed: 2.4,
          points: 1
        }
      })
      @game.enemies << q
      q = nil
    end
  end
end
