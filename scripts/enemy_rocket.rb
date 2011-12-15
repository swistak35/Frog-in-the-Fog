class EnemyRocket < Enemy
  def initialize(game, px, py, angle, attr)
    super game, px, py, angle, "enemy_rocket.png", attr
    
    @speed ||= 10.0
    @hit_points ||= 3.0
    
    @angle = Gosu::angle(@px, @py, @game.ship.px, @game.ship.py)
    
    @type = :bullet
  end
  
  def refresh
    @game.enemies.delete(self) if @game.out_of_range(@px, @py)
    
    @vx = Gosu::offset_x(@angle, 0.5) * @speed
    @vy = Gosu::offset_y(@angle, 0.5) * @speed
    
    @px += @vx
    @py += @vy
  end
end
