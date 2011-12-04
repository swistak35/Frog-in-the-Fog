class Wave
  
  @@lastWave = 0
  @@waves = []
  
  def self.generate(game)
    if Gosu::milliseconds - 60000 > @@lastWave
      wave = @@waves.select do |wave|
        game.player.score.between? wave.min, wave.max
      end.rand
      
      wave.new(game) unless wave.nil?
    end
  end
  
  def initialize(game)
    @game = game
    generate_enemies
    @@lastWave = Gosu::milliseconds
  end
  
  def self.min
    self::Min
  end
  
  def self.max
    self::Max
  end
  
  def generate_enemies
  end
end
