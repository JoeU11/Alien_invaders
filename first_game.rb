require 'gosu'



module ZOrder #don't know what this does. Was in tutorial. Mess around here later
  BACKGROUND, PLAYER, UI = *0..3
end

class Player
  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    @x = @vel_x = @vel_y = @angle = 0.0 
    @score = 0
  end

  def move_left
    @x -= 6
  end

  def move_right
    @x += 6
  end

  def draw
    @image.draw_rot(@x, 670, 1, @angle) 
  end
end



class Invaders < Gosu::Window
  def initialize
    super 1280, 720 
    self.caption = "Working Title"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true) 

    @player = Player.new
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.move_right
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
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