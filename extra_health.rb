class ExtraHealth < Extra

  @@requirement = 2000
  @@catchArea = 15
  
  def initialize(game)
    super game, "extra_health.png"
  end
  
  def gain
    baseHitPoints = Ship.class_variable_get(:@@baseHitPoints)
    
    @game.ship.hit_points += 0.2 * baseHitPoints
    @game.ship.hit_points = baseHitPoints if @game.ship.hit_points > baseHitPoints
  end
end
