class Window < Gosu::Window
  attr_accessor :game, :menu, :state, :pause, :sound
  
  def initialize(sound = false, fullscreen = false)
    super(1020, 740, fullscreen)
    self.caption = "Frog In Space"
    
    @state = :menu
    @menu = Menu.new(self)
  end

  def update
    case @state
      when :menu
        @menu.update
      when :game
        @game.update
      when :pause
        @pause.update
    end
  end
  
  def draw
    case @state
      when :menu
        @menu.draw
      when :game
        @game.draw
      when :pause
        @pause.draw
    end
  end
  
  def button_down(id)
    case @state
      when :menu
        @menu.button_down(id)
      when :game
        @game.button_down(id)
      when :pause
        @pause.button_down(id)
    end
  end
end

