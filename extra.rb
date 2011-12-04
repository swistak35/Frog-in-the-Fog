class Extra
  attr_reader :px, :py
  
  @@lastExtra = 0
  @@extras = []
  
  def self.generate(game)
    if Gosu::milliseconds - 27000 > @@lastExtra
      @@lastExtra = Gosu::milliseconds unless random_new_extra(game).nil?
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
    @collisionSample ||= Gosu::Sample.new(@window, "samples/extra_gain.wav")
    @collisionSample.play(0.6)
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