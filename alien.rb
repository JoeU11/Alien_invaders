class Alien
  attr_reader :x, :y

  def initialize(x, y, level) 
    @image = Gosu::Image.new("media/invader_1.png") 
    @x = x
    @y = y
    @timer = 0
    @level = level
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0.0)
  end

  def update
    @timer += 1 * @level / 1.3
    if @timer >= 70
      @y = @y + 20
      @timer = 0
    end
  end

  def hit_target?(player_x, player_y)
    hit = false
    if Gosu.distance(@x, @y, player_x, player_y) < 30 || @y > 700
      hit = true
    end
    return hit
  end
end