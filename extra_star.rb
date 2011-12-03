class ExtraStar < Extra
  
  @@requirement = 0
  @@catchArea = 10
  @@bonus = 100
  
  def initialize(game)
    super game, "extra_star.png"
  end
  
  def gain
    @game.player.score += @@bonus
    @@bonus *= 1.02
  end
end
