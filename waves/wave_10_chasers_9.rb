class Wave10Chasers < Wave
  @@waves << self
  
  Min = 34850
  Max = 42350
  
  def generate_enemies
    puts "'[...]Dziewiec dla smiertelnikow, ludzi smierci podleglych[...]'"
    
    9.times do |i|
      x = 101 + i*130
      
      @game.enemies << EnemyChaser.new(@game, x, -40, {
        hit_points: 120.0,
        speed: 1.2,
        points: 240.0,
        shoot_bullet: true
      })
    end
  end
end
