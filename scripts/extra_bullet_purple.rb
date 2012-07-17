class ExtraBulletPurple < Extra
  @@extras << self
  
  Requirement = 2000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_purple.png"
  end
  
  def gain
    BulletPurple.upgrade
  end
end
