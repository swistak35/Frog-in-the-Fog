class Extra
  attr_reader :px, :py
  
  def Requirement
    $settings[self.class.to_s.to_sym][:Requirement]
  end
  
  def CatchArea
    $settings[self.class.to_s.to_sym][:CatchArea]
  end
  
  def initialize(game, image)
    @game = game
    @window = @game.window
    @px = Gosu::random(10, @window.width-10)
    @py = Gosu::random(10, @window.height-10)
    @image = Gosu::Image.new @window, "images/"+image, false
    @collisionSample ||= Gosu::Sample.new(@window, "samples/extra_gain.wav")
    @collisionSample.play(0.6)
  end
  
  def update
    refresh
  end
  
  def gain
  end
  
  def refresh
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Bullet, 0)
  end
end
