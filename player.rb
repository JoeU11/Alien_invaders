class Player
  attr_reader :x, :y, :score

  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    @vel_x = @vel_y = @angle = 0.0 
    @y = 670
    @x = 500
    @score = 0
  end

  def move_left
    @x -= 7
  end

  def move_right
    @x += 7
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle) 
  end

  def add_score
    @score += 10
  end
end