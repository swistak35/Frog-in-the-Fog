class EnemyLiner < Enemy
  def initialize(game, px, py, hit_points, speed, points)
    super game, px, py, 0, "enemy_liner.png", hit_points, speed, points
  end
  
  def refresh
    @py = -40 if @py > @game.window.height
    @py += @speed
  end
end
