class BulletPurple < Bullet
  
  @@destroyArea = 10.0
  @@power = 3.5
  @@speed = 35.0
  @@reload = 500.0
  @@lastShot = 0
  
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_purple.png", "bullet_purple.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * @@speed
    @vy = Gosu::offset_y(@angle, 0.5) * @@speed
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def shoot_bullet_purple
    lastShot = BulletPurple.class_variable_get(:@@lastShot)
    reload = BulletPurple.class_variable_get(:@@reload)
    
    if (Gosu::milliseconds > lastShot + reload) || (lastShot == 0)
      @game.bullets << BulletPurple.new(@game, @px, @py, @angle)
      BulletPurple.class_variable_set(:@@lastShot, Gosu::milliseconds)
    end
  end
end

