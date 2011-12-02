class Bullet
  attr_reader :px, :py, :angle
  
  def DestroyArea
    $settings[self.class.to_s.to_sym][:DestroyArea]
  end
  
  def Power
    $settings[self.class.to_s.to_sym][:Power]
  end
  
  def Speed
    $settings[self.class.to_s.to_sym][:Speed]
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
