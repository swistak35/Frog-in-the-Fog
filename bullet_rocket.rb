$settings[:BulletRocket] = {
  :DestroyArea => 30.0,
  :Power => 10.0,
  :Speed => 20.0,
  :Reload => 2000.0,
  :LastShot => 0
}

class BulletRocket < Bullet
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_rocket.png", "bullet_rocket.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * $settings[:BulletRocket][:Speed]
    @vy = Gosu::offset_y(@angle, 0.5) * $settings[:BulletRocket][:Speed]
    
    @target = @game.enemies.sort_by do |enemy|
      Gosu::distance(@px, @py, enemy.px, enemy.py)
    end.first
  end
  
  def refresh
    if !@target.nil? && @game.enemies.include?(@target)
      @angle = Gosu::angle(@px, @py, @target.px, @target.py)
      @vx = Gosu::offset_x(@angle, 0.5) * $settings[:BulletRocket][:Speed]
      @vy = Gosu::offset_y(@angle, 0.5) * $settings[:BulletRocket][:Speed]
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
    if (Gosu::milliseconds > $settings[:BulletRocket][:LastShot] + $settings[:BulletRocket][:Reload]) || ($settings[:BulletRocket][:LastShot] == 0)
      @game.bullets << BulletRocket.new(@game, @px, @py, @angle)
      $settings[:BulletRocket][:LastShot] = Gosu::milliseconds
    end
  end
end

