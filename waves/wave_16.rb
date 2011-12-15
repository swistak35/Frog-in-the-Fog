class Wave16 < Wave
  @@waves << self
  
  Min = 92300
  Max = 99999
  
  def generate_enemies
    if EnemyBoss.class_variable_get(:@@state) == :before
      @game.enemies << EnemyBoss.new(@game, 520.0, -200.0, {
        hit_points: 1000.0,
        speed: 0.3,
        points: 8000,
        shoot_bullet: true,
        shoot_rocket: true,
        reload: 10000,
        amount: 5,
        rocket_hit_points: 8.0,
        rocket_speed: 3.2,
        rocket_reload: 2300,
        bullet_reload: 400,
        enemy_kid: {
          hit_points: 1,
          speed: 1.8,
          points: 1
        }
      })
    else
      14.times do |k|
        y = -40 - 50*k
        
        10.times do |i|
          x = 51 + i*102
          @game.enemies << EnemyLiner.new(@game, x, y, {
            hit_points: 5.0,
            speed: 1.0,
            points: 21.0
          })
        end
      end
    end
  end
end
