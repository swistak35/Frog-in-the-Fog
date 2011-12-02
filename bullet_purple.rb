$settings[:BulletPurple] = {
  :DestroyArea => 10.0,
  :Power => 3.5,
  :Speed => 35.0,
  :Reload => 500.0,
  :LastShot => 0
}

class BulletPurple < Bullet
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_purple.png", "bullet_purple.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * $settings[:BulletPurple][:Speed]
    @vy = Gosu::offset_y(@angle, 0.5) * $settings[:BulletPurple][:Speed]
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def shoot_bullet_purple
    if (Gosu::milliseconds > $settings[:BulletPurple][:LastShot] + $settings[:BulletPurple][:Reload]) || ($settings[:BulletPurple][:LastShot] == 0)
      @game.bullets << BulletPurple.new(@game, @px, @py, @angle)
      $settings[:BulletPurple][:LastShot] = Gosu::milliseconds
    end
  end
end

