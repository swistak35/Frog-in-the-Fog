$settings[:ExtraBulletBomb] = {
  :Requirement => 3000,
  :CatchArea => 30
}

class ExtraBulletBomb < Extra
  def initialize(game)
    super game, "extra_bullet_bomb.png"
  end
  
  def gain
    $settings[:BulletBomb][:Power] *= 1.25
    $settings[:BulletBomb][:Reload] *= 0.98
    $settings[:BulletBombPiece][:Power] *= 1.15
  end
end
