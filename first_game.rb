require 'gosu'

class Player
  attr_reader :x, :y

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
end

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

  def hit_target(aliens) 
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

class Alien
  attr_reader :x, :y

  def initialize(x, y)
    @image = Gosu::Image.new("media/invader_1.png") 
    @x = x
    @y = y
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0.0)
  end
end



class Invaders < Gosu::Window
  def initialize
    super 1220, 720 
    self.caption = "Working Title"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @score_border = Gosu::Image.new("media/border.png", :tileable => false)
    @explosion_animation = Gosu::Image.load_tiles("media/explosion.png", 60, 50)
    @explosions = []

    @aliens = []
    @player = Player.new
    @lasers = []
    @cooldown = 0
    @alien_count = 0
    @alien_x = 900
    @alien_y = 50
  end

  def update 
    @laser_counter = 0
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      if @player.x > 25
        @player.move_left
      end
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      if @player.x < 940
        @player.move_right
      end
    end
    if Gosu.button_down? Gosu::KbSpace
      if @cooldown <= 0
        @lasers << Laser.new(@player.y, @player.x)
        @cooldown = 10
      end
    end
    @cooldown -= 1
    @lasers.each {|laser| laser.move}
    @lasers.reject! {|laser| laser.y == 0}

    while @alien_count < 15 #Add row variable 
      @aliens.push(Alien.new(@alien_x, @alien_y))
      @alien_x -= 60
      @alien_count += 1
    end
    while @laser_counter < @lasers.length
      if @lasers[@laser_counter].hit_target(@aliens)
        @explosions.push(Explosion.new(@explosion_animation, @lasers[@laser_counter].x, @lasers[@laser_counter].y))
        @lasers.delete_at(@laser_counter)
        @laser_counter -= 1
      end
      @laser_counter += 1
    end
    @explosions.reject!(&:done?)
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0, 1.9, 1.5)
    @lasers.each {|laser| laser.draw}
    @font.draw_text("Score: \n\n\n Level: ", 1000, 70, 1, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
    @score_border.draw(980, 40, 1,)
    @aliens.each {|alien| alien.draw}
    @explosions.each {|explosion| explosion.draw}
  end

  def button_down(id) 
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end
  
Invaders.new.show 