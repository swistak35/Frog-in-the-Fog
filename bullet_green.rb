class BulletPackageGreen
  def initialize(game, px, py, angle)
    amount = BulletGreen.class_variable_get(:@@amount).to_i
    
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
  
  @@destroyArea = 4.0
  @@power = 1.7
  @@speed = 25.0
  @@reload = 900.0
  @@amount = 2.0
  @@lastShot = 0
  
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_green.png", "bullet_green.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * @@speed
    @vy = Gosu::offset_y(@angle, 0.5) * @@speed
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def shoot_bullet_green
    lastShot = BulletGreen.class_variable_get(:@@lastShot)
    reload = BulletGreen.class_variable_get(:@@reload)
    
    if (Gosu::milliseconds > lastShot + reload) || (lastShot == 0)
      BulletPackageGreen.new(@game, @px, @py, @angle)
      BulletGreen.class_variable_set(:@@lastShot, Gosu::milliseconds)
    end
  end
end


