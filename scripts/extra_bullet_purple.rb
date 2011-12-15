class ExtraBulletPurple < Extra
  @@extras << self
  
  Requirement = 2000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_purple.png"
  end
  
  def gain
    speed = BulletPurple.class_variable_get(:@@speed) * 1.15
    reload = BulletPurple.class_variable_get(:@@reload) * 0.88
    
    BulletPurple.class_variable_set(:@@speed, speed)
    BulletPurple.class_variable_set(:@@reload, reload)
  end
end
