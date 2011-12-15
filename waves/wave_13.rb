class Wave13 < Wave
  @@waves << self
  
  Min = 60200
  Max = 69950
  
  def generate_enemies
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyPath.new(@game, x, -80, {
        hit_points: 26.0,
        speed: 1.0,
        points: 58.0,
        path: [
          [x, -40.0],
          [x, 780.0]
        ]
      })
    end
    
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyPath.new(@game, x, 820, {
        hit_points: 26.0,
        speed: 1.0,
        points: 58.0,
        path: [
          [x, 780.0],
          [x, -40.0]
        ]
      })
    end
    
    8.times do |i|
      y = 51 + i*102
      @game.enemies << EnemyPath.new(@game, -80, y, {
        hit_points: 26.0,
        speed: 1.32,
        points: 58.0,
        path: [
          [-40.0, y],
          [1060.0, y]
        ]
      })
    end
    
    8.times do |i|
      y = 51 + i*102
      @game.enemies << EnemyPath.new(@game, 1100, y, {
        hit_points: 26.0,
        speed: 1.32,
        points: 58.0,
        path: [
          [1060.0, y],
          [-40.0, y]
        ]
      })
    end
  end
end
