class ExtraBulletGreen < Extra
  
  @@requirement = 2000
  @@catchArea = 15
  
  def initialize(game)
    super game, "extra_bullet_green.png"
  end
  
  def gain
    power = BulletGreen.class_variable_get(:@@power) * 1.1
    amount = BulletGreen.class_variable_get(:@@amount) + 1
    reload = BulletGreen.class_variable_get(:@@reload) * 0.95
    
    BulletGreen.class_variable_set(:@@power, power)
    BulletGreen.class_variable_set(:@@amount, amount)
    BulletGreen.class_variable_set(:@@reload, reload)
  end
end
