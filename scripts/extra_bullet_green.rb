class ExtraBulletGreen < Extra
  @@extras << self
  
  Requirement = 2000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_green.png"
  end
  
  def gain
    BulletGreen.upgrade
  end
end
