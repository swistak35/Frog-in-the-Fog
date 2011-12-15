class Pause
  def initialize(window)
    @window = window
    @window.state = :pause
    
    @background_image = Gosu::Image.new @window, "images/background_pause.png", true
    @pause_start = Gosu::milliseconds
  end
  
  def update
  end
  
  def draw
    @window.game.draw
    @background_image.draw(0, 0, ZOrder::UI)
  end
  
  def button_down(id)
    case id
      when Gosu::KbEscape
        back_to_game
      when Gosu::KbN
        back_to_game
      when Gosu::KbReturn
        back_to_menu
      when Gosu::KbT
        back_to_menu
    end
  end
  
  def back_to_game
    @window.game.paused += Gosu::milliseconds - @pause_start
    @window.state = :game
  end
  
  def back_to_menu
    @window.state = :menu
  end
end
