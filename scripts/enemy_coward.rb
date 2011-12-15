class EnemyCoward < Enemy
  
  @@rotation = 1.0
  @@lastCreated = 0
  
  def self.generate(game)
    window = game.window
    if (Gosu::milliseconds - 30000) > @@lastCreated
      x = Gosu::random(10, window.width-10)
      y = Gosu::random(10, window.height-10)
      if game.player.score >= 1000
        game.enemies << EnemyCoward.new(game, x, y, 30.0, 2.0, 180.0)
      end
    end
  end
  
  def initialize(game, px, py, hit_points, speed, points)
    super game, px, py, 0, "enemy_coward.png", hit_points, speed, points
    @bullet = nil
    @@lastCreated = Gosu::milliseconds
  end
  
  def refresh
    if !@bullet.nil?
      @px += Gosu::offset_x(@angle, 0.5) * @speed * 2.5
      @py += Gosu::offset_y(@angle, 0.5) * @speed * 2.5
      @bullet = nil if !@game.bullets.include? @bullet
    elsif @bullet.nil? && !@game.bullets.empty?
      @bullet = @game.bullets.last
      @angle = Gosu::angle(@bullet.px, @bullet.py, @px, @py) + Game.random_minus * Gosu::random(80,100)
    else
      @angle += @@rotation
      
      @px += Gosu::offset_x(@angle, 0.5) * @speed
      @py += Gosu::offset_y(@angle, 0.5) * @speed
    end
    
    @px %= @window.width
    @py %= @window.height
  end
end


