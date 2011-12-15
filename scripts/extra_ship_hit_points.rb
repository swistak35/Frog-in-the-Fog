class ExtraShipHitPoints < Extra
  @@extras << self
  
  Requirement = 1000
  CatchArea = 40
  
  def initialize(game)
    super game, "extra_ship_hit_points.png"
  end
  
  def gain
    baseHitPoints = Ship.class_variable_get(:@@baseHitPoints) * 1.2
    
    Ship.class_variable_set(:@@baseHitPoints, baseHitPoints)
  end
end
