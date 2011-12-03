class EnemyLiner < Enemy
  
  @@lastCreated = 0
  
  def self.generate(game)
    if Gosu::milliseconds - 60000 > @@lastCreated
      generatePackage1(game) if game.player.score.between?(2500, 5000)
      generatePackage2(game) if game.player.score.between?(5000, 7500)
      #generatePackage3(game) if game.player.score.between?(7500, 10000)
    end
  end
  
  def self.generatePackage1(game)
    10.times do |i|
      x = 51 + i*102
      game.enemies << EnemyLiner.new(game, x, -40, 10, 0.6, 35)
    end
    @@lastCreated = Gosu::milliseconds
  end
  
  def self.generatePackage2(game)
    10.times do |i|
      x = 51 + i*102
      game.enemies << EnemyLiner.new(game, x, -40, 8, 0.7, 35)
    end
    
    10.times do |i|
      x = 51 + i*102
      game.enemies << EnemyLiner.new(game, x, -100, 8, 0.7, 35)
    end
    @@lastCreated = Gosu::milliseconds
  end
  
  def initialize(game, px, py, hit_points, speed, points)
    super game, px, py, 0, "enemy_liner.png", hit_points, speed, points
  end
  
  def refresh
    @game.enemies.delete(self) if @py > @game.window.height
    @py += @speed
  end
end
