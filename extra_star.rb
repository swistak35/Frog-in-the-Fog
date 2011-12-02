$settings[:ExtraStar] = {
  :Requirement => 0,
  :CatchArea => 20,
  :Bonus => 100
}

class ExtraStar < Extra
  def initialize(game)
    super game, "extra_star.png"
  end
  
  def gain
    @game.player.score += $settings[:ExtraStar][:Bonus]
    $settings[:ExtraStar][:Bonus] *= 1.02
  end
end
