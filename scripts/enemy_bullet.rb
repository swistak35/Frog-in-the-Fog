class EnemyBullet < Enemy
  def initialize(game, px, py, angle, attr)
    super game, px, py, angle, "enemy_bullet.png", attr
    
    @speed ||= 10.0
    @hit_points ||= 1.0
    
    @vx = Gosu::offset_x(@angle, 0.5) * @speed
    @vy = Gosu::offset_y(@angle, 0.5) * @speed
    
    @type = :bullet
  end
  
  def refresh
    @game.enemies.delete(self) if @game.out_of_range(@px, @py)
    
    @px += @vx
    @py += @vy
  end
end
