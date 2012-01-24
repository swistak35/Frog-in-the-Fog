class Extra
  attr_reader :px, :py
  
  def self.reset
    @@lastExtra = 0
  end
  
  @@extras = []
  
  def self.generate(game)
    if game.time - 27000 > @@lastExtra
      @@lastExtra = game.time unless random_new_extra(game).nil?
    end
  end
  
  def self.random_new_extra(game)
    extra = @@extras.select do |extra|
      game.player.score >= extra.requirement
    end.rand
    
    extra.new(game) unless extra.nil?
    extra
  end
  
  def self.catchArea
    self::CatchArea
  end
  
  def self.requirement
    self::Requirement
  end
  
  def initialize(game, image)
    @game = game
    @window = @game.window
    @px = Gosu::random(10, @window.width-10)
    @py = Gosu::random(10, @window.height-10)
    @image = Gosu::Image.new @window, "images/"+image, false
    if @game.sound
      @collisionSample = Gosu::Sample.new(@window, "samples/extra_gain.wav")
      @collisionSample.play(1.0)
    end
    @game.extras << self
  end
  
  def update
    refresh
  end
  
  def gain
  end
  
  def refresh
  end
  
  def draw
    @image.draw_rot(@px, @py, ZOrder::Bullet, 0)
  end
end
