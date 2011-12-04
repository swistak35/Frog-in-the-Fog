class WaveLiners4 < Wave
  @@waves << self
  
  Min = 2000
  Max = 3500
  
  def generate_enemies
    4.times do |k|
      y = -40 - 60*k
      
      10.times do |i|
        x = 51 + i*102
        @game.enemies << EnemyLiner.new(@game, x, y, 6, 0.8, 27)
      end
    end
  end
end
