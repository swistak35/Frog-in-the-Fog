class Enemy
  attr_reader :px, :py, :width, :height
  attr_accessor :hit_points
  
  def Points
    $settings[self.class.to_s.to_sym][:Points]
  end
  
  def initialize(game, px, py, angle, level, image)
    @game, @px, @py, @angle, @level = game, px, py, angle, level
    @window = @game.window
    @image = Gosu::Image.new @window, "images/"+image, false
    @width = @image.width
    @height = @image.height
  end
  
  def dead?
    @hit_points <= 0
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Ship, @angle)
  end
  
  def update
    refresh
  end
end
