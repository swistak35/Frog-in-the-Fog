class EnemyKid < Enemy
  def initialize(game, px, py, attr)
    super game, px, py, 0, "enemy_kid.png", attr
    
    @distance ||=200
    @lx = @px
    @ly = @py
    @angle = Gosu::random(0,360)
  end
  
  def refresh
    if Gosu::distance(@px, @py, @lx, @ly) >= @distance
      @angle = Gosu::random(0,360)
      @lx = @px
      @ly = @py
    end
    
    @px += Gosu::offset_x(@angle, 0.5) * @speed
    @py += Gosu::offset_y(@angle, 0.5) * @speed
    
    @px %= @window.width
    @py %= @window.height
  end
end
