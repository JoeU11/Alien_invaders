require 'gosu'

module ZOrder #don't know what this does. Was in tutorial. Mess around here later
  BACKGROUND, PLAYER, UI = *0..3
end

class Player
  attr_reader :x, :y

  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    @x = @vel_x = @vel_y = @angle = 0.0 
    @y = 670
    @score = 0
  end

  def move_left
    @x -= 6
  end

  def move_right
    @x += 6
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle) 
  end
end

class Laser
  attr_reader :y
  def initialize(player_y, player_x) #need to pass in player position (x and y) to generate in correct place
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
end



class Invaders < Gosu::Window
  def initialize
    super 1280, 720 
    self.caption = "Working Title"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true) #space png is not filling screen

    @player = Player.new
    @laser = []
    @cooldown = 0
  end

  def update #Add button keys and actions here.
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.move_right
    end
    if Gosu.button_down? Gosu::KbSpace #need to introduce timer for fire-rate
      if @cooldown <= 0
        @laser << Laser.new(@player.y, @player.x)
        @cooldown = 10
      end
    end
    @cooldown -= 1
    @laser.each {|laser| laser.move}
    @laser.reject! {|laser| laser.y == 0}
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @laser.each {|laser| laser.draw}
  end

  def button_down(id) 
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end
  
Invaders.new.show #main loop