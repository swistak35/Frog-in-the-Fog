$settings[:BulletGreen] = {
  :DestroyArea => 4.0,
  :Power => 1.7,
  :Speed => 25.0,
  :Reload => 900.0,
  :Amount => 2.0,
  :LastShot => 0
}

class BulletPackageGreen
  def initialize(game, px, py, angle)
    amount = $settings[:BulletGreen][:Amount].to_i
    
    angle_mod = 90.0 / amount
    angle_mod = 15.0 if angle_mod > 15
    
    (game.bullets << BulletGreen.new(game, px, py, angle)) if amount % 2 == 1
    
    [1,-1].each do |mode|
      (1..amount/2).each do |i|
        an = angle + mode * i * angle_mod
        game.bullets << BulletGreen.new(game, px, py, an)
      end
    end
  end
end

class BulletGreen < Bullet
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_green.png", "bullet_green.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * $settings[:BulletGreen][:Speed]
    @vy = Gosu::offset_y(@angle, 0.5) * $settings[:BulletGreen][:Speed]
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def shoot_bullet_green
    if (Gosu::milliseconds > $settings[:BulletGreen][:LastShot] + $settings[:BulletGreen][:Reload]) || ($settings[:BulletGreen][:LastShot] == 0)
      BulletPackageGreen.new(@game, @px, @py, @angle)
      $settings[:BulletGreen][:LastShot] = Gosu::milliseconds
    end
  end
end


