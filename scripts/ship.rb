class Ship
  attr_reader :px, :py, :angle
  attr_accessor :hit_points
  
  def self.reset
    @@speed = 0.8
    @@baseHitPoints = 250.0
  end

  @@maxSpeed = 0.95
  @@rotation = 4.5

  def initialize(game, px, py)
    @game, @px, @py = game, px, py
    @window = @game.window
    @image = Gosu::Image.new @window, "images/spaceship.png", false
    
    @hit_points = @@baseHitPoints
    
    @vx, @vy, @angle = 0, 0, 0
  end
  
  def update
    turn_left if @window.button_down? Gosu::KbLeft
    turn_right if @window.button_down? Gosu::KbRight
    accelerate if @window.button_down? Gosu::KbUp
    brake if @window.button_down? Gosu::KbDown
    shoot_bullet_purple if @window.button_down? Gosu::KbZ
    shoot_bullet_rocket if @window.button_down? Gosu::KbX
    shoot_bullet_green if @window.button_down? Gosu::KbC
    place_bomb if @window.button_down? Gosu::KbB
    
    update_pos
  end
  
  def turn_left
    @angle -= @@rotation
  end
  
  def turn_right
    @angle += @@rotation
  end
  
  def accelerate
    @vx += Gosu::offset_x(@angle, 0.5)
    @vy += Gosu::offset_y(@angle, 0.5)
  end
  
  def brake
    @vx -= Gosu::offset_x(@angle, 0.5)
    @vy -= Gosu::offset_y(@angle, 0.5)
  end
  
  def update_pos
    @px += @vx
    @py += @vy
    
    @px %= @window.width
    @py %= @window.height
    
    @vx *= @@speed
    @vy *= @@speed
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Ship, @angle)
  end
end
