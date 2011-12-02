$settings[:ExtraBulletPurple] = {
  :Requirement => 2000,
  :CatchArea => 30
}

class ExtraBulletPurple < Extra
  def initialize(game)
    super game, "extra_bullet_purple.png"
  end
  
  def gain
    $settings[:BulletPurple][:Speed] *= 1.1
    $settings[:BulletPurple][:Reload] *= 0.9
  end
end
