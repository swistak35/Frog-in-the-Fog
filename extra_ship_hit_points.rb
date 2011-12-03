class ExtraShipHitPoints < Extra
  
  @@requirement = 1000
  @@catchArea = 15
  
  def initialize(game)
    super game, "extra_ship_hit_points.png"
  end
  
  def gain
    baseHitPoints = Ship.class_variable_get(:@@baseHitPoints) * 1.1
    
    Ship.class_variable_set(:@@baseHitPoints, baseHitPoints)
  end
end
