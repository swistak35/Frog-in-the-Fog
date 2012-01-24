class Wave
  
  def self.reset
    @@lastWave = 0
  end
  
  @@waves = []
  
  def self.generate(game)
    if game.time - 60000 > @@lastWave
      score = game.player.score
      wave = @@waves.select do |wave|
        score.between? wave.min, wave.max
      end.rand
      
      if wave.nil?
        if EnemyBoss.state == :after
          wave2 = @@waves.select do |wave2|
            score > wave2.max
          end.rand
          
          unless wave2.nil?
            wave2.new(game)
            @@lastWave -= ((score.to_f - wave2.max) / score.to_f) * 50000
          end
        end
      else
        wave.new(game)
      end
    end
  end
  
  def initialize(game)
    @game = game
    generate_enemies
    @@lastWave = @game.time
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
