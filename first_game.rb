require 'gosu'

# module ZOrder #don't know what this does. Was in tutorial. Mess around here later
#   BACKGROUND, PLAYER, UI = *0..3
# end

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

class Laser
  attr_reader :y
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
    aliens.reject! {|alien| Gosu.distance(@x, @y, alien.x, alien.y) < 25}

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

    @aliens = []
    @player = Player.new
    @laser = []
    @cooldown = 0
    @alien_count = 0
    @alien_x = 900
    @alien_y = 50
  end

  def update 
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
        @laser << Laser.new(@player.y, @player.x)
        @cooldown = 10
      end
    end
    @cooldown -= 1
    @laser.each {|laser| laser.move}
    @laser.reject! {|laser| laser.y == 0}

    while @alien_count < 15 #Add row variable 
      @aliens.push(Alien.new(@alien_x, @alien_y))
      @alien_x -= 60
      @alien_count += 1
    end
    @laser.each {|laser| laser.hit_target(@aliens)}
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0, 1.9, 1.5)
    @laser.each {|laser| laser.draw}
    @font.draw_text("Score: \n\n\n Level: ", 1000, 70, 1, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
    @score_border.draw(980, 40, 1,)
    @aliens.each {|alien| alien.draw}
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