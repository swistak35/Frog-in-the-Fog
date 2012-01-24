class BulletBomb < Bullet
  
  def self.reset
    @@destroyArea = 20.0
    @@power = 30.0
    @@reload = 2500.0
    @@speed = 0
    @@countDown = 5
    @@lastShot = 0
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
      @game.bullets << BulletBombPiece.new(@game, @px, @py, angle)
    end
  end
end

class BulletBombPiece < Bullet
  
  @@destroyArea = 4.0
  @@power = 1.0
  @@speed = 60.0
  @@amount = 36.0
  
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
      @game.bullets << BulletBomb.new(@game, @px, @py, 0)
      BulletBomb.lastShot = @game.time
    end
  end
end


