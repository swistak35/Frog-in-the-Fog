class ExtraBulletRocket < Extra
  @@extras << self
  
  Requirement = 2000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_rocket.png"
  end
  
  def gain
    speed = BulletRocket.class_variable_get(:@@speed) * 1.05
    power = BulletRocket.class_variable_get(:@@power) * 1.2
    reload = BulletRocket.class_variable_get(:@@reload) * 0.97
    
    BulletRocket.class_variable_set(:@@speed, speed)
    BulletRocket.class_variable_set(:@@power, power)
    BulletRocket.class_variable_set(:@@reload, reload)
  end
end
