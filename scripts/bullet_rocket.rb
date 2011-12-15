class BulletRocket < Bullet
  
  @@destroyArea = 30.0
  @@power = 10.0
  @@speed = 20.0
  @@reload = 2000.0
  @@lastShot = 0
  
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_rocket.png", "bullet_rocket.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * @@speed
    @vy = Gosu::offset_y(@angle, 0.5) * @@speed
    
    @target = @game.enemies.select do |enemy|
      enemy.type != :bullet
    end.sort_by do |enemy|
      Gosu::distance(@px, @py, enemy.px, enemy.py)
    end.first
  end
  
  def refresh
    if !@target.nil? && @game.enemies.include?(@target)
      @angle = Gosu::angle(@px, @py, @target.px, @target.py)
      @vx = Gosu::offset_x(@angle, 0.5) * @@speed
      @vy = Gosu::offset_y(@angle, 0.5) * @@speed
    end
    update_pos
  end
  
  def update_pos
    @px += @vx
    @py += @vy
  end
end

class Ship
  def shoot_bullet_rocket
    lastShot = BulletRocket.lastShot
    reload = BulletRocket.reload
    
    if (@game.time > lastShot + reload) || (lastShot == 0)
      @game.bullets << BulletRocket.new(@game, @px, @py, @angle)
      BulletRocket.lastShot = @game.time
    end
  end
end

