class Enemy
  attr_reader :px, :py, :width, :height
  attr_accessor :hit_points, :points
  
  def initialize(game, px, py, angle, image, attr)
    @game, @px, @py, @angle = game, px, py, angle
    @window = @game.window
    @image = Gosu::Image.new @window, "images/"+image, false
    @width = @image.width
    @height = @image.height
    @points || 
    
    attr.each do |key, value|
      eval("@#{key} = #{value}")
    end
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
