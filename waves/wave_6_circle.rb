class Wave6Circle < Wave
  @@waves << self
  
  Min = 11550
  Max = 16050
  
  def generate_enemies
    10.times do |i|
      y = -40 - i*40
      
      @game.enemies << EnemyCircle.new(@game, 203, y, {
        hit_points: 30.0,
        speed: 0.8,
        points: 55.0,
        direction: :left,
        speed_2: 3.0
      })
    end
    
    10.times do |i|
      y = -40 - i*40
      
      @game.enemies << EnemyCircle.new(@game, 815, y, {
        hit_points: 30.0,
        speed: 0.8,
        points: 55.0,
        direction: :right,
        speed_2: 3.0
      })
    end
    
    4.times do |k|
      y = -40 - 60*k
      
      10.times do |i|
        x = 51 + i*102
        
        @game.enemies << EnemyLiner.new(@game, x, y, {
          hit_points: 23.0,
          speed: 0.8,
          points: 37.0
        })
      end
    end
  end
end
