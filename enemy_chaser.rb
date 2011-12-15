class EnemyChaser < Enemy
  
  Rotation = 1.0
  
  def initialize(game, px, py, hit_points, speed, points, crossline = 100, shooting = nil)
    super game, px, py, 180, "bird_3.png", hit_points, speed, points
    @state = :running
    @crossline = crossline
    @shooting = shooting
    @ship = @game.ship
    @modifier = Gosu::random(-70,70)
  end
  
  def refresh
    case @state
      when :running
        @py += @speed
        if @py > @crossline
          @state = :chasing
        end
      when :chasing
        @angle = Gosu::angle(@px, @py, @ship.px, @ship.py) + @modifier
        
        @px += Gosu::offset_x(@angle, 0.5) * @speed * 2
        @py += Gosu::offset_y(@angle, 0.5) * @speed * 2
    end
  end
end
