class Enemy
  attr_reader :px, :py, :width, :height, :points
  attr_accessor :hit_points
  
  def initialize(game, px, py, angle, image, hit_points, speed, points)
    @game, @px, @py, @angle, @hit_points, @speed, @points = game, px, py, angle, hit_points, speed, points
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
