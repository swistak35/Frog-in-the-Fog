class Wave11 < Wave
  @@waves << self
  
  Min = 42550
  Max = 50800
  
  def generate_enemies
    q = EnemyMother.new(@game, -100, 300, {
      hit_points: 700,
      speed: 0.7,
      points: 300,
      enemy_kid: {
        hit_points: 4.0,
        speed: 3.5,
        points: 1
      }
    })
    @game.enemies << q
    q = nil
    
    56.times do |i|
      y = -40 - i*150
      
      q = EnemyPath.new(@game, -40, y, {
        hit_points: 30.0,
        speed: 3.0,
        points: 40.0,
        path: [
          [10.0, 10.0],
            [510.0, 370.0],
          [510.0, 10.0],
            [510.0, 370.0],
          [1010.0, 10.0],
            [510.0, 370.0],
          [1010.0, 370.0],
            [510.0, 370.0],
          [1010.0, 730.0],
            [510.0, 370.0],
          [510.0, 730.0],
            [510.0, 370.0],
          [10.0, 730.0],
            [510.0, 370.0],
          [10.0, 370.0],
            [510.0, 370.0]
        ]
      })
      @game.enemies << q
      q = nil
    end
  end
end
