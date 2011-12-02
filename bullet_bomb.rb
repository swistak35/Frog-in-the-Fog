$settings[:BulletBomb] = {
  :DestroyArea => 20.0,
  :Power => 100.0,
  :Reload => 2500.0,
  :Speed => 0,
  :countDown => 5,
  :LastShot => 0
}

$settings[:BulletBombPiece] = {
  :DestroyArea => 4.0,
  :Power => 1.0,
  :Speed => 60.0,
  :Amount => 36.0
}

class BulletBomb < Bullet
  def initialize(game, px, py, angle)
    @countdown = $settings[:BulletBomb][:countDown]
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
  def initialize(game, px, py, angle)
    super game, px, py, angle, "bullet_bomb_piece.png", "bullet_bomb_piece.wav"
    
    @vx = Gosu::offset_x(@angle, 0.5) * $settings[:BulletBombPiece][:Speed]
    @vy = Gosu::offset_y(@angle, 0.5) * $settings[:BulletBombPiece][:Speed]
  end
  
  def refresh
    @px += @vx
    @py += @vy
  end
end

class Ship
  def place_bomb
    if (Gosu::milliseconds > $settings[:BulletBomb][:LastShot] + $settings[:BulletBomb][:Reload]) || ($settings[:BulletBomb][:LastShot] == 0)
      @game.bullets << BulletBomb.new(@game, @px, @py, 0)
      $settings[:BulletBomb][:LastShot] = Gosu::milliseconds
    end
  end
end


