class BulletRocket < Bullet
  Upgrades = [
    {
      speed: 8.0,
      power: 10.0,
      reload: 2000.0
    },
    {
      speed: 8.8,
      power: 12.0,
      reload: 1890.0
    },
    {
      speed: 9.68,
      power: 14.4,
      reload: 1786.0
    },
    {
      speed: 10.65,
      power: 17.28,
      reload: 1687.0
    },
    {
      speed: 11.71,
      power: 20.74,
      reload: 1594.0
    },
    {
      speed: 12.88,
      power: 24.88,
      reload: 1507.0
    },
    {
      speed: 14.17,
      power: 29.86,
      reload: 1424.0
    },
    {
      speed: 15.59,
      power: 35.83,
      reload: 1346.0
    },
    {
      speed: 17.15,
      power: 43.0,
      reload: 1271.0
    },
    {
      speed: 18.86,
      power: 51.6,
      reload: 1202.0
    }
  ]
  def self.reset
    @@destroyArea = 30.0
    @@lastShot = 0
    @@level = -1
    BulletRocket.upgrade
  end
  
  def self.upgrade
    @@level += 1
    if @@level < 10
      @@speed = Upgrades[@@level][:speed]
      @@power = Upgrades[@@level][:power]
      @@reload = Upgrades[@@level][:reload]
    else
      @@power += 2
    end
  end
  
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
      x = BulletRocket.new(@game, @px, @py, @angle)
      @game.bullets << x
      x = nil
      BulletRocket.lastShot = @game.time
    end
  end
end

