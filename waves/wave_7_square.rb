class Wave7Square < Wave
  @@waves << self
  
  Min = 16250
  Max = 21500
  
  def generate_enemies
    40.times do |i|
      y = -40 - i*50
      @game.enemies << EnemyPath.new(@game, 260, y, {
        hit_points: 50.0,
        speed: 3.0,
        points: 131.0,
        path: [
          [260.0,120.0],
          [760.0,120.0],
          [760.0,620.0],
          [260.0,620.0]
        ]
      })
    end
  end
end
