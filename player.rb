class Player
  attr_accessor :score, :level, :nextLevel
  
  def initialize(game)
    @game = game
    @window = @game.window
    @score = 0
    @level = 1
    @nextLevel = 500
  end
  
  def update
    if @score >= @nextLevel
      @level += 1
      @nextLevel = @nextLevel + @nextLevel * 1.1
      @game.msg "Zdobyles #{@level} poziom!"
      upgrade
    end
  end
  
  def upgrade
    @game.random_new_extra
    
    case @level
      when 2
        @game.msg "To juz 2!"
    end
  end
end
