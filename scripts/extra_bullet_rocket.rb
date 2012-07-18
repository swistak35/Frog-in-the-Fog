class ExtraBulletRocket < Extra
  @@extras << self
  
  Requirement = 2000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_rocket.png"
  end
  
  def gain
    BulletRocket.upgrade
  end
end
