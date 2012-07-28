class BulletPackageGreen
  def initialize(game, px, py, angle)
    amount = BulletGreen.amount.to_i
    
    angle_mod = 90.0 / amount
    angle_mod = 15.0 if angle_mod > 15
    
    (game.bullets << BulletGreen.new(game, px, py, angle)) if amount % 2 == 1
    
    [1,-1].each do |mode|
      (1..amount/2).each do |i|
        an = angle + mode * i * angle_mod
        x = BulletGreen.new(game, px, py, an)
        game.bullets << x
        x = nil
      end
    end
  end
end

class BulletGreen < Bullet
  Upgrades = [
    {
      power: 1.7,
      reload: 900.0,
      amount: 2.0
    },
    {
      power: 1.87,
      reload: 855.0,
      amount: 3.0
    },
    {
      power: 2.06,
      reload: 812.0,
      amount: 4.0
    },
    {
      power: 2.27,
      reload: 770.0,
      amount: 5.0
    },
    {
      power: 2.5,
      reload: 731.0,
      amount: 7.0
    },
    {
      power: 2.74,
      reload: 693.0,
      amount: 9.0
    },
    {
      power: 3.01,
      reload: 655.0,
      amount: 12.0
    },
    {
      power: 3.32,
      reload: 621.0,
      amount: 16.0
    },
    {
      power: 3.65,
      reload: 590.0,
      amount: 21.0
    },
    {
      power: 4.0,
      reload: 559.0,
      amount: 27.0
    },
  ]
  def self.reset
    @@destroyArea = 4.0
    @@speed = 25.0
    @@lastShot = 0
    @@level = -1
    BulletGreen.upgrade
  end
  
  def self.upgrade
    @@level += 1
    if @@level < 10
      @@power = Upgrades[@@level][:power]
      @@amount = Upgrades[@@level][:amount]
      @@reload = Upgrades[@@level][:reload]
    else
      @@power += 0.05
      @@amount += 0.1
    end
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


