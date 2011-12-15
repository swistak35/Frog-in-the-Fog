class Highscore
  def initialize(window)
    @window = window
    
    @background_image = Gosu::Image.new @window, "images/background_highscore.png", true
    @fontDate = Gosu::Font.new(@window, Gosu::default_font_name, 20)
    @fontScore = Gosu::Font.new(@window, Gosu::default_font_name, 20)
    @scores = []
    load_scores
    @scores.each do |score|
      puts score
    end
  end
  
  def load_scores
    begin
      File.readlines("#{Dir.home}/.froginthefog").each do |line|
        score = line.split ";"
        @scores << [Time.at(score[0].to_i), score[1].to_i]
      end
    rescue Errno::ENOENT
    end
  end
  
  def save_scores
    f = File.new "#{Dir.home}/.froginthefog", "w"
    @scores.sort_by do |score|
      score[1]
    end.reverse[0..9].each do |score|
      f.puts "#{score[0].to_i};#{score[1]}"
    end
    f.close
  end
  
  def put(score)
    @scores << [Time.now, score.to_i]
    save_scores
  end
  
  def update
  end
  
  def draw
    @background_image.draw(0, 0, ZOrder::UI)
    
    @scores.each_with_index do |score, i|
      @fontScore.draw(score[1], 190, 373+32*i, ZOrder::UI, 1.0, 1.0, 0xff0000ff)
      @fontDate.draw(score[0].strftime("%d.%m.%Y, %H:%M"), 550, 373+32*i, ZOrder::UI, 1.0, 1.0, 0xff0000ff)
    end
  end
  
  def button_down(id)
    @window.state = :menu
  end
end
