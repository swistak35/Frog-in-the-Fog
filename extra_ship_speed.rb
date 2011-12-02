$settings[:ExtraShipSpeed] = {
  :Requirement => 1000,
  :CatchArea => 30
}

class ExtraShipSpeed < Extra
  def initialize(game)
    super game, "extra_ship_speed.png"
  end
  
  def gain
    $settings[:Ship][:Speed] += 0.01
  end
end
