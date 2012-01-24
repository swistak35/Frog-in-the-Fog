class EnemyBoss < Enemy

  def self.reset
    @@state = :before
  end

  def self.state=(state)
    @@state = state
  end
  
  def self.state
    @@state
  end
  
  def initialize(game, px, py, attr)
    super game, px, py, 180, "enemy_boss.png", attr
    
    @@state = :running
    @line = 280
    @ship = @game.ship
    
    @amount ||= 3
    @reload ||= 15000
    @children_last = @game.time
    @rotation ||= 0.5
    @rotation_last = @game.time
    @rotation_reload = 20
  end
  
  def refresh
    if @game.time - @rotation_last >= @rotation_reload
      new_angle = Gosu::angle(@px, @py, @ship.px, @ship.py)
      old_angle = @angle
      puts @angle
      m = (new_angle - old_angle).abs
      
      
      
      if m.between?(-@rotation,@rotation)
        @angle = new_angle
      elsif new_angle > old_angle
        @angle = old_angle + @rotation
      elsif new_angle < old_angle
        @angle = old_angle - @rotation
      end
      @rotation_last = @game.time
    end
    
    @@state = :after if dead?
    @py += @speed if @py <= @line
    
    if @game.time - @children_last > @reload
      @amount.times do
        @game.enemies << EnemyKid.new(@game, @px, @py, @enemy_kid)
      end
      @children_last = @game.time
    end
    
  end
end
