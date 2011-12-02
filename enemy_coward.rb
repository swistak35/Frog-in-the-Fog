$settings[:EnemyCoward] = {
  :BaseHitPoints => 30.0,
  :Speed => 2.0,
  :Rotation => 1.0,
  :Points => 120.0,
  :LastCreated => 0,
  :Requirement => 300.0
}

class EnemyCoward < Enemy
  def self.generate(game)
    window = game.window
    if (game.player.score >= $settings[:EnemyCoward][:Requirement]) && ((Gosu::milliseconds - 30000) > $settings[:EnemyCoward][:LastCreated])
      x = Gosu::random(10, window.width-10)
      y = Gosu::random(10, window.height-10)
      game.enemies << EnemyCoward.new(game, x, y, 0)
      $settings[:EnemyCoward][:LastCreated] = Gosu::milliseconds
    end
  end
  
  def initialize(game, px, py, level)
    super game, px, py, 0, level, "enemy_coward.png"
    @hit_points = $settings[:EnemyCoward][:BaseHitPoints]
    @bullet = nil
  end
  
  def refresh
    if !@bullet.nil?
      @px += Gosu::offset_x(@angle, 0.5) * $settings[:EnemyCoward][:Speed] * 2.5
      @py += Gosu::offset_y(@angle, 0.5) * $settings[:EnemyCoward][:Speed] * 2.5
      @bullet = nil if !@game.bullets.include? @bullet
    elsif @bullet.nil? && !@game.bullets.empty?
      @bullet = @game.bullets.last
      @angle = Gosu::angle(@bullet.px, @bullet.py, @px, @py) + Game.random_minus * Gosu::random(80,100)
    else
      @angle += $settings[:EnemyCoward][:Rotation]
      
      @px += Gosu::offset_x(@angle, 0.5) * $settings[:EnemyCoward][:Speed]
      @py += Gosu::offset_y(@angle, 0.5) * $settings[:EnemyCoward][:Speed]
    end
    
    @px %= @window.width
    @py %= @window.height
  end
end


