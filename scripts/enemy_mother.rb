class EnemyMother < Enemy
  def initialize(game, px, py, attr)
    super game, px, py, 90, "enemy_mother.png", attr
    
    @amount ||= 3
    @reload ||= 15000
    @children_last = @game.time
  end
  
  def refresh
    @px = -40 if @px - 30 > @game.window.width
    @px += @speed
    
    if @game.time - @children_last > @reload
      @amount.times do
        @game.enemies << EnemyKid.new(@game, @px, @py, @enemy_kid)
      end
      @children_last = @game.time
    end
  end
end
