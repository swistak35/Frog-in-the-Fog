$settings[:ExtraBulletRocket] = {
  :Requirement => 3000,
  :CatchArea => 30
}

class ExtraBulletRocket < Extra
  def initialize(game)
    super game, "extra_bullet_rocket.png"
  end
  
  def gain
    $settings[:BulletRocket][:Speed] *= 1.05
    $settings[:BulletRocket][:Power] *= 1.2
    $settings[:BulletRocket][:Reload] *= 0.97
  end
end
