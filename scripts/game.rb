class Game
  attr_accessor :window, :bullets, :enemies, :ship, :messages, :player,
                :lastWave, :extras, :time, :paused, :sound
  attr_reader :start
  
  def initialize(window)
    @window = window
    @window.state = :game
    
    @background_image = Gosu::Image.new @window, "images/background_game.png", true
    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
    @fontHUD = Gosu::Font.new(@window, Gosu::default_font_name, 30)
    
    @ship = Ship.new self, 320, 240
    @player = Player.new self
    @start = Gosu::milliseconds
    @messages = ["", "", ""]
    @lastExtra = 0
    @lastWave = 0
    
    @bullets = []
    @enemies = []
    @extras = []
    
    EnemyBoss.state = :before
    @time = Gosu::milliseconds
    @paused = 0
    @sound = @window.sound
  end

  def update
    @window.game_over = GameOver.new(@window) if @ship.hit_points <= 0
    @time = Gosu::milliseconds - @paused
    updating_objects
    
    checking_enemy_bullet_collision
    checking_enemy_ship_collision
    checking_ship_extra_collision
    
    check_enemies_life
    generating_new_objects
  end
  
  def updating_objects
    @ship.update
    @player.update
    @bullets.each { |bullet| bullet.update }
    @extras.each { |extra| extra.update }
    @enemies.each { |enemy| enemy.update }
  end
  
  def checking_ship_extra_collision
    @extras.each do |extra|
      if Gosu::distance(extra.px, extra.py, @ship.px, @ship.py) < extra.class.catchArea
        extra.gain
        @extras.delete extra
      end
    end
  end
  
  def checking_enemy_bullet_collision
    @enemies.each do |enemy|
      @bullets.each do |bullet|
        if (Gosu::distance(enemy.px, enemy.py, bullet.px, bullet.py) < (bullet.destroyArea + [enemy.width, enemy.height].min/2)) && (enemy.type != :bullet)
          enemy.hit_points -= bullet.power
          @bullets.delete bullet
        end
      end
    end
  end
  
  def checking_enemy_ship_collision
    @enemies.each do |enemy|
      if Gosu::distance(enemy.px, enemy.py, @ship.px, @ship.py) < (20 + [enemy.width, enemy.height].min/2)
        @ship.hit_points -= enemy.hit_points
        @enemies.delete enemy
      end
    end
  end
  
  def check_enemies_life
    @enemies.each do |enemy|
      if enemy.dead?
        @enemies.delete enemy
        @player.score += enemy.points
      end
    end
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    
    @bullets.each { |bullet| bullet.draw }
    @extras.each { |extra| extra.draw }
    
    @ship.draw
    @enemies.each { |enemy| enemy.draw }
    
    @fontHUD.draw("Wynik: #{@player.score.to_i}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    @fontHUD.draw("Zycie: #{@ship.hit_points.to_i}/#{Ship.class_variable_get(:@@baseHitPoints).to_i}", 10, 40, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    @fontHUD.draw("Poziom: #{@player.level}", 10, 70, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    
    @font.draw(@messages[-1], 10, 530, ZOrder::UI, 1.0, 1.0, 0xffff0000)
    @font.draw(@messages[-2], 10, 550, ZOrder::UI, 1.0, 1.0, 0xffee0000)
    @font.draw(@messages[-3], 10, 570, ZOrder::UI, 1.0, 1.0, 0xffdd0000)
  end
  
  def msg(txt)
    @messages << txt
  end
  
  def generating_new_objects
    EnemySmall.generate(self)
    #EnemyCoward.generate(self)
    
    Wave.generate(self)
    
    Extra.generate(self)
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        @window.pause = Pause.new(@window)
      when Gosu::KbS
        @player.score += 10000
      when Gosu::KbD
        Extra.random_new_extra self
    end
  end
  
  def out_of_range(x, y)
    (y < 0 || y > @window.height || x < 0 || x > @window.width)
  end
  
  def self.random_minus
    [1,-1].shuffle[0]
  end
end
