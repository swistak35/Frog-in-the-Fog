class EnemyCircle < Enemy
  
  Rotation = 1.0
  
  def initialize(game, px, py, attr)
    super game, px, py, 180, "enemy_circle.png", attr
    @state = :running
    
    @direction ||= [:left, :right].rand
    @speed_2 ||= @speed*2
    @rotation = (@direction.eql?(:right) ? -1 : 1) * Rotation
  end
  
  def refresh
    case @state
      when :running
        @py += @speed
        if @py > 300
          @state = :circle
        end
      when :circle
        @angle += @rotation
        
        @px += Gosu::offset_x(@angle, 0.5) * @speed_2
        @py += Gosu::offset_y(@angle, 0.5) * @speed_2
    end
  end
end
