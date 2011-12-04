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
      @nextLevel *= 2
      @nextLevel += 100
      @game.msg "Zdobyles #{@level} poziom!"
      upgrade
    end
  end
  
  def upgrade
    Extra.random_new_extra(@game)
    
    #case @level
      #when 2
        #@game.msg "To juz 2!"
    #end
  end
end
