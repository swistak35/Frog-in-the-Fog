class Wave14 < Wave
  @@waves << self
  
  Min = 70150
  Max = 80650
  
  def generate_enemies
    59.times do |i|
      x = -40 - 58*i
      @game.enemies << EnemyPath.new(@game, x, 10.0, {
        hit_points: 20.0,
        speed: 4.0,
        points: 50.0,
        path: [
          [10.0, 10.0],
          [1010.0, 10.0],
          [1010.0, 730.0],
          [10.0, 730.0]
        ]
      })
    end
    
    @game.enemies << EnemyChaser.new(@game, 520, -40, {
      hit_points: 200.0,
      speed: 1.8,
      points: 350.0,
      shoot_rocket: true
    })
    
    [10.0, 730.0].each do |y|
      @game.enemies << EnemyMother.new(@game, -40, y, {
        hit_points: 200,
        speed: 0.8,
        points: 270,
        reload: 7500,
        amount: 2,
        enemy_kid: {
          hit_points: 2,
          speed: 2.4,
          points: 1
        }
      })
    end
  end
end
