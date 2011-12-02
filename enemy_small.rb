$settings[:EnemySmall] = {
  :BaseHitPoints => 20.0,
  :Speed => 1.0,
  :Rotation => 1.0,
  :Points => 100.0,
  :LastCreated => 0,
  :Requirement => 0
}

class EnemySmall < Enemy
  def self.generate(game)
    window = game.window
    if ((Gosu::milliseconds - 5000) > $settings[:EnemySmall][:LastCreated])
      x = Gosu::random(10, window.width-10)
      y = Gosu::random(10, window.height-10)
      game.enemies << EnemySmall.new(game, x, y, 0)
      $settings[:EnemySmall][:LastCreated] = Gosu::milliseconds
    end
  end
  
  def initialize(game, px, py, level)
    super game, px, py, 0, level, "enemy_small.png"
    @hit_points = $settings[:EnemySmall][:BaseHitPoints] + 5 * @level
  end
  
  def refresh
    @angle += $settings[:EnemySmall][:Rotation] - 0.2 * @level
    
    @px += Gosu::offset_x(@angle, 0.5) * ($settings[:EnemySmall][:Speed] + @level * 0.3) 
    @py += Gosu::offset_y(@angle, 0.5) * ($settings[:EnemySmall][:Speed] + @level * 0.3)
    
    @px %= @window.width
    @py %= @window.height
  end
end
