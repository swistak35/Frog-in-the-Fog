class ExtraBulletPurple < Extra
  
  @@requirement = 2000
  @@catchArea = 15
  
  def initialize(game)
    super game, "extra_bullet_purple.png"
  end
  
  def gain
    speed = BulletPurple.class_variable_get(:@@speed) * 1.1
    reload = BulletPurple.class_variable_get(:@@reload) * 0.9
    
    BulletPurple.class_variable_set(:@@speed, speed)
    BulletPurple.class_variable_set(:@@reload, reload)
  end
end
