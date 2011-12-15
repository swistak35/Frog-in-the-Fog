class EnemySmall < Enemy
  
  @@baseHitPoints = 20.0
  @@lastCreated = 0
  @@rotation = 1.0
  
  def self.generate(game)
    window = game.window
    if (Gosu::milliseconds - 8000) > @@lastCreated
      begin
        x = rand(window.width-60) + 30
        y = rand(window.height-60) + 30
      end while game.ship.px.between?(x-50,x+50) && game.ship.py.between?(y-50,y+50)
      
      game.enemies << EnemySmall.new(game, x, y, {
        hit_points: 20.0,
        speed: 1.0,
        points: 50.0
      })
    end
  end
  
  def initialize(game, px, py, attr)
    super game, px, py, 0, "enemy_small.png", attr
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
