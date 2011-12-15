class ExtraBulletBomb < Extra
  @@extras << self
  
  Requirement = 3000
  CatchArea = 35
  
  def initialize(game)
    super game, "extra_bullet_bomb.png"
  end
  
  def gain
    power = BulletBomb.class_variable_get(:@@power) * 1.25
    reload = BulletBomb.class_variable_get(:@@reload) * 0.98
    power_piece = BulletBombPiece.class_variable_get(:@@power) * 1.15
    
    BulletBomb.class_variable_set(:@@power, power)
    BulletBomb.class_variable_set(:@@reload, reload)
    BulletBombPiece.class_variable_set(:@@power, power_piece)
  end
end
