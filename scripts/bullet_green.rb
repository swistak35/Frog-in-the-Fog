class BulletPackageGreen
  def initialize(game, px, py, angle)
    amount = BulletGreen.amount.to_i
    
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
  
  def self.reset
    @@destroyArea = 4.0
    @@power = 1.7
    @@speed = 25.0
    @@reload = 900.0
    @@amount = 2.0
    @@lastShot = 0
  end
  
  def self.amount
    @@amount
  end
  
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
    lastShot = BulletGreen.lastShot
    reload = BulletGreen.reload
    
    if (@game.time > lastShot + reload) || (lastShot == 0)
      BulletPackageGreen.new(@game, @px, @py, @angle)
      BulletGreen.lastShot = @game.time
    end
  end
end


