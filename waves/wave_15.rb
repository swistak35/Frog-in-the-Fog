class Wave15 < Wave
  @@waves << self
  
  Min = 80850
  Max = 92100
  
  def generate_enemies
    @sx = @game.ship.px
    @sy = @game.ship.py
    
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyPath.new(@game, x, -80, {
        hit_points: 35.0,
        speed: 1.2,
        points: 67.0,
        path: [
          [x, -40.0],
          [@sx, @sy]
        ]
      })
    end
    
    10.times do |i|
      x = 51 + i*102
      @game.enemies << EnemyPath.new(@game, x, 820, {
        hit_points: 35.0,
        speed: 1.2,
        points: 67.0,
        path: [
          [x, 780.0],
          [@sx, @sy]
        ]
      })
    end
    
    8.times do |i|
      y = 51 + i*102
      @game.enemies << EnemyPath.new(@game, -80, y, {
        hit_points: 35.0,
        speed: 1.3,
        points: 67.0,
        path: [
          [-40.0, y],
          [@sx, @sy]
        ]
      })
    end
    
    8.times do |i|
      y = 51 + i*102
      @game.enemies << EnemyPath.new(@game, 1100, y, {
        hit_points: 35.0,
        speed: 1.3,
        points: 67.0,
        path: [
          [1060.0, y],
          [@sx, @sy]
        ]
      })
    end
  end
end
