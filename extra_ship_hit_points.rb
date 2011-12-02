$settings[:ExtraShipHitPoints] = {
  :Requirement => 1000,
  :CatchArea => 30
}

class ExtraShipHitPoints < Extra
  def initialize(game)
    super game, "extra_ship_hit_points.png"
  end
  
  def gain
    $settings[:Ship][:BaseHitPoints] *= 1.1
  end
end
