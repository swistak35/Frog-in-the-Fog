class ExtraStar < Extra
  @@extras << self
  
  Requirement = 0
  CatchArea = 30

  def self.reset
    @@bonus = 100
  end
  
  def initialize(game)
    super game, "extra_star.png"
  end
  
  def gain
    @game.player.score += @@bonus
    @@bonus *= 1.03
  end
end
