class BulletPurple < Bullet
  Upgrades = [
    {
      speed: 35.0,
      reload: 500.0
    },
    {
      speed: 39.2,
      reload: 428.0
    },
    {
      speed: 43.9,
      reload: 366.0
    },
    {
      speed: 49.2,
      reload: 313.0
    },
    {
      speed: 55.1,
      reload: 267.0
    },
    {
      speed: 61.7,
      reload: 228.0
    },
    {
      speed: 69.1,
      reload: 195.0
    },
    {
      speed: 77.4,
      reload: 167.0
    },
    {
      speed: 86.7,
      reload: 142.0
    },
    {
      speed: 97.1,
      reload: 122.0
    },
  ]
  
  def self.reset
    @@destroyArea = 10.0
    @@power = 3.5
    @@lastShot = 0
    @@level = -1
    BulletPurple.upgrade
  end
  
  def self.upgrade
    @@level += 1
    if @@level < 10
      @@speed = Upgrades[@@level][:speed]
      @@reload = Upgrades[@@level][:reload]
      @@power += 0.025
    else
      @@power += 0.05
    end
  end
  
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
    lastShot = BulletPurple.lastShot
    reload = BulletPurple.reload
    
    if (@game.time > lastShot + reload) || (lastShot == 0)
      @game.bullets << BulletPurple.new(@game, @px, @py, @angle)
      BulletPurple.lastShot = @game.time
    end
  end
end

