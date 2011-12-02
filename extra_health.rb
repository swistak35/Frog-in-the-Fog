$settings[:ExtraHealth] = {
  :Requirement => 2000,
  :CatchArea => 30
}

class ExtraHealth < Extra
  def initialize(game)
    super game, "extra_health.png"
  end
  
  def gain
    @game.ship.hit_points += 0.2*$settings[:Ship][:BaseHitPoints]
    
    if @game.ship.hit_points > $settings[:Ship][:BaseHitPoints] 
      @game.ship.hit_points = $settings[:Ship][:BaseHitPoints]
    end
  end
end
