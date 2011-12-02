class Menu
  def initialize(window)
    @window = window
    
    @background_image = Gosu::Image.new @window, "images/background_menu.png", true
    
    @buttons = [
      {
        :on => Gosu::Image.new(@window, "images/button_new_game_on.png", true),
        :off => Gosu::Image.new(@window, "images/button_new_game_off.png", true),
        :active => false,
        :code => lambda do
          @window.game = Game.new(@window); @window.state = :game
        end
      },
      {
        :on => Gosu::Image.new(@window, "images/button_story_on.png", true),
        :off => Gosu::Image.new(@window, "images/button_story_off.png", true),
        :active => false,
        :code => lambda do
          puts "TODO: Story!"
        end
      },
      {
        :on => Gosu::Image.new(@window, "images/button_exit_on.png", true),
        :off => Gosu::Image.new(@window, "images/button_exit_off.png", true),
        :active => false,
        :code => lambda do
          @window.close
        end
      },
    ]
    
    @active = 0
    switch(@active)
  end
  
  def update
  end
  
  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    
    @buttons.count.times do |i|
      button = @buttons[i]
      
      y = 270 + 90 * i
      
      if button[:active]
        button[:on].draw(170, y, ZOrder::UI)
      else
        button[:off].draw(170, y, ZOrder::UI)
      end
    end
  end
  
  def button_down(id)
    case id
      when Gosu::KbEscape
        @window.close
      when Gosu::KbReturn
        @buttons[@active][:code].call
      when Gosu::KbUp
        switch(@active-1) if @active > 0
      when Gosu::KbDown
        switch(@active+1) if @active < 2
    end
  end
  
  def switch(new_active)
    @buttons[@active][:active] = false
    @active = new_active
    @buttons[@active][:active] = true
  end
end
