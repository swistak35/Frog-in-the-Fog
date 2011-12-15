class GameOver
  def initialize(window)
    @window = window
    @window.state = :game_over
    
    @background_image = Gosu::Image.new @window, "images/background_game_over.png", true
    @fontHUD = Gosu::Font.new(@window, Gosu::default_font_name, 110)
    @score = @window.game.player.score
    hs = Highscore.new(@window)
    hs.put(@score)
  end
  
  def update
  end
  
  def draw
    @window.game.draw
    @background_image.draw(0, 0, ZOrder::UI)
    @fontHUD.draw(@score.to_i, 230, 385, ZOrder::UI, 1.0, 1.0, 0xff0000ff)
  end
  
  def button_down(id)
    @window.state = :menu
  end
end
