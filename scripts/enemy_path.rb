class EnemyPath < Enemy
  
  def initialize(game, px, py, attr)
    super game, px, py, 180, "enemy_path.png", attr
    
    @pn = 0
  end
  
  def refresh
    if Gosu::distance(@px, @py, @path[@pn][0], @path[@pn][1]) < 5
      @pn += 1
      @pn = 0 if @path[@pn].nil?
    else
      @angle = Gosu::angle(@px, @py, @path[@pn][0], @path[@pn][1])
      
      @px += Gosu::offset_x(@angle, 0.5) * @speed * 2
      @py += Gosu::offset_y(@angle, 0.5) * @speed * 2
    end
  end
end
