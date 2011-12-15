class ExtraShipSpeed < Extra
  @@extras << self
  
  Requirement = 1000
  CatchArea = 40
  
  def initialize(game)
    super game, "extra_ship_speed.png"
  end
  
  def gain
    speed = Ship.class_variable_get(:@@speed) + 0.01
    max_speed = Ship.class_variable_get(:@@maxSpeed)
    
    Ship.class_variable_set(:@@speed, speed) if speed <= max_speed
  end
end
