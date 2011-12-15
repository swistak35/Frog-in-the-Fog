class EnemyChaser < Enemy
  
  Rotation = 1.0
  
  def initialize(game, px, py, attr)
    super game, px, py, 180, "enemy_chaser.png", attr
    @state = :running
    
    @crossline ||= 100
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
