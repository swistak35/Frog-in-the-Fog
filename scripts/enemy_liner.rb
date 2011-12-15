class EnemyLiner < Enemy
  def initialize(game, px, py, attr)
    super game, px, py, 180, "enemy_liner.png", attr
  end
  
  def refresh
    @py = -40 if @py > @game.window.height
    @py += @speed
  end
end
