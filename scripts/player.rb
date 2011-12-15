class Player
  attr_accessor :score, :level, :nextLevel
  
  def initialize(game)
    @game = game
    @window = @game.window
    @score = 0.0
    @level = 1
    @nextLevel = 500
  end
  
  def update
    if @score >= @nextLevel
      @level += 1
      @nextLevel += 500 + (@level-1)*100
      @game.msg "Zdobyles #{@level} poziom!"
      upgrade
    end
  end
  
  def upgrade
    Extra.random_new_extra(@game)
  end
end
