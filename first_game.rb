require 'gosu'
require_relative 'player.rb'
require_relative 'explosion.rb'
require_relative 'laser.rb'
require_relative 'alien.rb'
require_relative 'levels.rb'

class Invaders < Gosu::Window
  def initialize
    super 1220, 720 
    self.caption = "Alien Invaders"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @score_border = Gosu::Image.new("media/border.png", :tileable => false)
    @explosion_animation = Gosu::Image.load_tiles("media/explosion.png", 60, 50)
    @explosions = []
    @aliens = []
    @player = Player.new
    @lasers = []
    @cooldown = 20
    @alien_count = 0
    @game_over = false
    @level = 1
    @level_complete = false
    @total_aliens = 15
    @game_start = true
    # @total_aliens = add_targets(@level) # added in for individual level testing
  end

  def update 
    if @game_start
      if @cooldown > 0
        @cooldown -= 1
      elsif Gosu.button_down? Gosu::KbSpace 
        @game_start = false
        @cooldown = 10
      end
    elsif !@game_over
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

      while @alien_count < @total_aliens 
        @alien_count += 1
        temp = update_alien_position(@alien_x, @alien_y, @level, @alien_count)
        @alien_x = temp[0]
        @alien_y = temp[1]
        @aliens.push(Alien.new(@alien_x, @alien_y, @level)) 
      end

      while @laser_counter < @lasers.length
        if @lasers[@laser_counter].hit_target?(@aliens)
          @explosions.push(Explosion.new(@explosion_animation, @lasers[@laser_counter].x, @lasers[@laser_counter].y))
          @lasers.delete_at(@laser_counter)
          @laser_counter -= 1
          @player.add_score
        end
        @laser_counter += 1
      end

      @explosions.reject!(&:done?)
      @aliens.each do |alien|
        alien.update
        if alien.hit_target?(@player.x, @player.y)
          @game_over = true
          @cooldown = 50
        end
      end 
      if @aliens.length == 0 
        @level_complete = true
        @cooldown += 2
        if Gosu.button_down? Gosu::KbSpace 
          if @cooldown > 50
            @level += 1
            @level_complete = false
            @alien_count = 0 
            @cooldown = 5
            @total_aliens = add_targets(@level) # comment out to test individual levels
          end
        end
      end
    else
      if @cooldown > 0
        @cooldown -= 1
      elsif Gosu.button_down? Gosu::KbSpace 
        @game_start = true
        @game_over = false
        p 1
        @cooldown = 15
        @level = 1
        @aliens = []
        @total_aliens = 15
        @alien_count = 0
        @level_complete = false
      end
    end
  end

  def draw
    @background_image.draw(0, 0, 0, 1.9, 1.5)
    if @game_start
      @font.draw_text("Alien Invaders", 400, 230, 1, scale_x = 4, scale_y = 4, color = 0xff_ffffff, mode = :default)
      @font.draw_text("Keys:\nMove: Left/Right Arrows\nShoot: Space Bar\n\nPress Space to start", 400, 330, 1, scale_x = 2, scale_y = 2, color = 0xff_ffffff, mode = :default)
    elsif !@game_over && !@level_complete
      @player.draw
      @lasers.each {|laser| laser.draw}
      @font.draw_text("Score: #{@player.score.to_s}\n\n\n Level: #{@level}", 1000, 70, 1, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
      @score_border.draw(980, 40, 1,)
      @aliens.each {|alien| alien.draw}
      @explosions.each {|explosion| explosion.draw}
    elsif @level_complete
      @font.draw_text("Level complete", 380, 240, 1, scale_x = 4, scale_y = 4, color = 0xff_ffffff, mode = :default)
      @font.draw_text("Press Space to continue", 413, 340, 1, scale_x = 2, scale_y = 2, color = 0xff_ffffff, mode = :default)
      @alien_x = 900
      @alien_y = 0
    else
      @font.draw_text("GAME OVER", 400, 230, 1, scale_x = 4, scale_y = 4, color = 0xff_ffffff, mode = :default)
      @font.draw_text("Score: #{@player.score.to_s}\nLevel: #{@level}", 540, 330, 1, scale_x = 2, scale_y = 2, color = 0xff_ffffff, mode = :default)
      @font.draw_text("Press Space to play again", 400, 530, 1, scale_x = 2, scale_y = 2, color = 0xff_ffffff, mode = :default)
    end
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