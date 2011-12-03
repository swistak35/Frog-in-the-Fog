class BulletBomb < Bullet
  
  @@destroyArea = 20.0
  @@power = 100.0
  @@reload = 2500.0
  @@speed = 0
  @@countDown = 5
  @@lastShot = 0
  
  def initialize(game, px, py, angle)
    @countdown = @@countDown
    super game, px, py, angle, "bullet_bomb_#{@countdown}.png"
    
    @explodingSample = Gosu::Sample.new(@window, "samples/bullet_bomb.wav")
    @lastCount = Gosu::milliseconds
  end
  
  def refresh
    if Gosu::milliseconds - @lastCount >= 1000
      @countdown -= 1
      @image = Gosu::Image.new(@window, "images/bullet_bomb_#{@countdown}.png", false) if @countdown > 0
      explode if @countdown == 0
      @lastCount = Gosu::milliseconds
    end
  end
  
  def explode
    @explodingSample.play(0.3)
    @game.bullets.delete(self)
    36.times do |i|
      angle= i * 10.0
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
    lastShot = BulletBomb.class_variable_get(:@@lastShot)
    reload = BulletBomb.class_variable_get(:@@reload)
    
    if (Gosu::milliseconds > lastShot + reload) || (lastShot == 0)
      @game.bullets << BulletBomb.new(@game, @px, @py, 0)
      BulletBomb.class_variable_set(:@@lastShot, Gosu::milliseconds)
    end
  end
end


