class ExtraBulletBomb < Extra
  @@extras << self
  
  Requirement = 3000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_bomb.png"
  end
  
  def gain
    BulletBomb.upgrade
    BulletBombPiece.upgrade
  end
end
