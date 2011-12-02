$settings[:ExtraBulletGreen] = {
  :Requirement => 2000,
  :CatchArea => 30
}

class ExtraBulletGreen < Extra
  def initialize(game)
    super game, "extra_bullet_green.png"
  end
  
  def gain
    $settings[:BulletGreen][:Amount] += 1
    $settings[:BulletGreen][:Power] *= 1.1
    $settings[:BulletGreen][:Reload] *= 0.95
  end
end
