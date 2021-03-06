class Player
  attr_accessor :score, :level, :nextLevel
  
  def initialize(game)
    @game = game
    @window = @game.window
    @score = 0.0
    @level = 1
    @nextLevel = 80
  end
  
  def update
    if @score >= @nextLevel
      @level += 1
      @nextLevel += 80 + (@level-1)*80
      @game.msg "Zdobyles #{@level} poziom!"
      upgrade
    end
  end
  
  def upgrade
    Extra.random_new_extra(@game)
  end
end
