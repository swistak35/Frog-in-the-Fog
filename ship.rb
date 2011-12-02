$settings[:Ship] = {
  :Speed => 0.8,
  :MaxSpeed => 0.98,
  :Rotation => 4.5,
  :BaseHitPoints => 200.0
}

class Ship
  attr_reader :px, :py, :angle
  attr_accessor :hit_points
  
  def initialize(game, px, py)
    @game, @px, @py = game, px, py
    @window = @game.window
    @image = Gosu::Image.new @window, "images/spaceship.png", false
    
    @hit_points = $settings[:Ship][:BaseHitPoints]
    
    @vx, @vy, @angle = 0, 0, 0
  end
  
  def update
    turn_left if @window.button_down? Gosu::KbLeft
    turn_right if @window.button_down? Gosu::KbRight
    accelerate if @window.button_down? Gosu::KbUp
    restrain if @window.button_down? Gosu::KbDown
    shoot_bullet_purple if @window.button_down? Gosu::KbZ
    shoot_bullet_rocket if @window.button_down? Gosu::KbX
    shoot_bullet_green if @window.button_down? Gosu::KbC
    place_bomb if @window.button_down? Gosu::KbB
    
    update_pos
  end
  
  def turn_left
    @angle -= $settings[:Ship][:Rotation]
  end
  
  def turn_right
    @angle += $settings[:Ship][:Rotation]
  end
  
  def accelerate
    @vx += Gosu::offset_x(@angle, 0.5)
    @vy += Gosu::offset_y(@angle, 0.5)
  end
  
  def restrain
    @vx -= Gosu::offset_x(@angle, 0.5)
    @vy -= Gosu::offset_y(@angle, 0.5)
  end
  
  def update_pos
    @px += @vx
    @py += @vy
    
    @px %= @window.width
    @py %= @window.height
    
    @vx *= $settings[:Ship][:Speed]
    @vy *= $settings[:Ship][:Speed]
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Ship, @angle)
  end
  
  def self.upgrade_speed
    $settings[:Ship][:Speed] += 0.01 if $settings[:Ship][:Speed] < $settings[:Ship][:MaxSpeed]
  end
  
  def self.upgrade_hit_points
    $settings[:Ship][:BaseHitPoints] *= 1.1
  end
end
