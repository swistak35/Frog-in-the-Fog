class Wave12 < Wave
  @@waves << self
  
  Min = 51000
  Max = 60000
  
  def generate_enemies
    e_path = []
    
    10.times do |i|
      x1 = (i % 2 == 0 ? -40 : 1060)
      x2 = (i % 2 == 1 ? -40 : 1060)
      y = Gosu::random(10, 730)
      
      e_path << [x1, y]
      e_path << [x2, y]
    end
    
    30.times do |i|
      x = -80 - 200*i
      @game.enemies << EnemyPath.new(@game, x, 370, {
        hit_points: 24.0,
        speed: 3.0,
        points: 60.0,
        path: e_path
      })
    end
  end
end
