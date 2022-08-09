class Laser
  attr_reader :y, :x
  def initialize(player_y, player_x)
    @image = Gosu::Image.new("media/laser.png")
    @y = player_y
    @x = player_x
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0.0)
  end

  def move
    @y -= 10 
  end

  def hit_target?(aliens) 
    hit = false
    index = 0
    while index < aliens.length do
      if Gosu.distance(@x, @y, aliens[index].x, aliens[index].y) < 25
        aliens.delete_at(index)
        hit = true
        index -= 1
      end
      index += 1
    end
    return hit
  end
end