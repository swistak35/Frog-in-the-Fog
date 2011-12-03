class EnemySmall < Enemy
  
  @@baseHitPoints = 20.0
  @@lastCreated = 0
  @@rotation = 1.0
  
  def self.generate(game)
    window = game.window
    if (Gosu::milliseconds - 5000) > @@lastCreated
      x = Gosu::random(10, window.width-10)
      y = Gosu::random(10, window.height-10)
      (game.enemies << EnemySmall.new(game, x, y, 20.0, 1.0, 100.0))
    end
  end
  
  def initialize(game, px, py, hit_points, speed, points)
    super game, px, py, 0, "enemy_small.png", hit_points, speed, points
    @@lastCreated = Gosu::milliseconds
  end
  
  def refresh
    @angle += @@rotation
    
    @px += Gosu::offset_x(@angle, 0.5) * @speed
    @py += Gosu::offset_y(@angle, 0.5) * @speed
    
    @px %= @window.width
    @py %= @window.height
  end
end
