class Enemy
  attr_reader :px, :py, :width, :height, :type
  attr_accessor :hit_points, :points
  
  def initialize(game, px, py, angle, image, attr)
    @game, @px, @py, @angle = game, px, py, angle
    @window = @game.window
    @image = Gosu::Image.new @window, "images/"+image, false
    @width = @image.width
    @height = @image.height
    
    
    attr.each do |key, value|
      instance_variable_set("@#{key}",value) unless value.nil?
    end
    
    
    if @shoot_bullet
      @bullet_last = 0
      @bullet_reload ||= 800
    end
    
    if @shoot_rocket
      @rocket_last = 0
      @rocket_reload ||= 1800
    end
  end
  
  def dead?
    @hit_points <= 0
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Ship, @angle)
  end
  
  def update
    shoot_bullet if @shoot_bullet
    shoot_rocket if @shoot_rocket
    
    refresh
  end
  
  def shoot_bullet
    if @game.time - @bullet_last > @bullet_reload
      @game.enemies << EnemyBullet.new(@game, @px, @py, @angle, {
        speed: @bullet_speed,
        hit_points: @bullet_hit_points,
        points: 1,
      })
      @bullet_last = @game.time
    end
  end
  
  def shoot_rocket
    if @game.time - @rocket_last > @rocket_reload
      @game.enemies << EnemyRocket.new(@game, @px, @py, @angle, {
        speed: @rocket_speed,
        hit_points: @rocket_hit_points,
        points: 1,
      })
      @rocket_last = @game.time
    end
  end
end
