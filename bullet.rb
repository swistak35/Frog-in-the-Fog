class Bullet
  attr_reader :px, :py, :angle
  
  def destroyArea
    self.class.class_variable_get(:@@destroyArea)
  end
  
  def power
    self.class.class_variable_get(:@@power)
  end
  
  def speed
    self.class.class_variable_get(:@@speed)
  end
  
  def lastShot
    self.class.class_variable_get(:@@lastShot)
  end
  
  def initialize(game, px, py, angle, image, collisionSample = nil)
    @game, @px, @py, @angle = game, px, py, angle
    @window = @game.window
    unless collisionSample.nil?
      @collisionSample = Gosu::Sample.new(@window, "samples/"+collisionSample) 
      @collisionSample.play(0.6)
    end
    @image = Gosu::Image.new(@window, "images/"+image, false)
  end
  
  def update
    @game.bullets.delete(self) if @game.out_of_range(@px, @py)
    refresh
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Bullet, @angle)
  end
  
  def collide
  end
end
