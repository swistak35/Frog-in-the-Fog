class BulletBomb < Bullet
  Upgrades = [
    {
      power: 30.0,
      reload: 2500.0
    },
    {
      power: 37.5,
      reload: 2325.0
    },
    {
      power: 46.88,
      reload: 2162.0
    },
    {
      power: 58.6,
      reload: 2010.0
    },
    {
      power: 73.0,
      reload: 1870.0
    },
    {
      power: 91.6,
      reload: 1739.0
    },
    {
      power: 114.0,
      reload: 1617.0
    },
    {
      power: 143.0,
      reload: 1504.0
    },
    {
      power: 179.0,
      reload: 1398.0
    },
    {
      power: 224.0,
      reload: 1301.0
    }
  ]
  
  def self.reset
    @@destroyArea = 20.0
    @@speed = 0
    @@countDown = 5
    @@lastShot = 0
    @@level = -1
    BulletBomb.upgrade
    BulletBombPiece.reset
  end
  
  def self.upgrade
    @@level += 1
    if @@level < 10
      @@power = Upgrades[@@level][:power]
      @@reload = Upgrades[@@level][:reload]
    else
      @@power += 1
    end
  end
  
  def initialize(game, px, py, angle)
    @countdown = @@countDown
    super game, px, py, angle, "bullet_bomb_#{@countdown}.png"
    
    @explodingSample = Gosu::Sample.new(@window, "samples/bullet_bomb.wav") if @game.sound
    @lastCount = @game.time
  end
  
  def refresh
    if @game.time - @lastCount >= 1000
      @countdown -= 1
      @image = Gosu::Image.new(@window, "images/bullet_bomb_#{@countdown}.png", false) if @countdown > 0
      explode if @countdown == 0
      @lastCount = @game.time
    end
  end
  
  def explode
    @explodingSample.play(0.3) if @game.sound
    @game.bullets.delete(self)
    90.times do |i|
      angle= i * 4.0
      x = BulletBombPiece.new(@game, @px, @py, angle)
      @game.bullets << x
      x = nil
    end
  end
end

class BulletBombPiece < Bullet
  Upgrades = [
    { power: 1.0 },
    { power: 1.2 },
    { power: 1.44 },
    { power: 1.73 },
    { power: 2.07 },
    { power: 2.49 },
    { power: 2.99 },
    { power: 3.58 },
    { power: 4.29 },
    { power: 5.16 }
  ]
  
  def self.reset
    @@destroyArea = 4.0
    @@speed = 60.0
    @@amount = 36.0
    @@level = -1
    BulletBombPiece.upgrade
  end
  
  def self.upgrade
    @@level += 1
    if @@level < 10
      @@power = Upgrades[@@level][:power]
    else
      @@power += 0.01
    end
  end
  
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_bomb_piece.png", "bullet_bomb_piece.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * @@speed
    @vy = Gosu::offset_y(@angle, 0.5) * @@speed
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def place_bomb
    lastShot = BulletBomb.lastShot
    reload = BulletBomb.reload
    
    if (@game.time > lastShot + reload) || (lastShot == 0)
      x = BulletBomb.new(@game, @px, @py, 0)
      @game.bullets << x
      x = nil
      BulletBomb.lastShot = @game.time
    end
  end
end


