class Explosion
  def initialize(anim, laser_x, laser_y)
    @anim = anim
    @x = laser_x - 15
    @y = laser_y - 10
    @current_frame = 0
  end

  def draw 
    img = @anim[Gosu.milliseconds / 100 % @anim.size]
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0, 1)
    @current_frame += 1
  end

  def done? 
    @done ||= @current_frame == @anim.size
  end
end