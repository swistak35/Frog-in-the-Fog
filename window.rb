class Window < Gosu::Window
  attr_accessor :game, :menu, :state
  
  def initialize(fullscreen = false)
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
    end
  end
  
  def draw
    case @state
      when :menu
        @menu.draw
      when :game
        @game.draw
    end
  end
  
  def button_down(id)
    case @state
      when :menu
        @menu.button_down(id)
      when :game
        @game.button_down(id)
    end
  end
end

