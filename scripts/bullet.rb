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
  
  def self.lastShot
    self.class_variable_get(:@@lastShot)
  end
  
  def self.reload
    self.class_variable_get(:@@reload)
  end
  
  def self.reload=(reload)
    self.class_variable_set(:@@reload, reload)
  end
  
  def self.lastShot=(lastShot)
    self.class_variable_set(:@@lastShot, lastShot)
  end
  
  def initialize(game, px, py, angle, image, collisionSample = nil)
    @game, @px, @py, @angle = game, px, py, angle
    @window = @game.window
    if !collisionSample.nil? && @game.sound
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
end
