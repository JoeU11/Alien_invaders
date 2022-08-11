require_relative 'alien.rb'

def update_alien_position(alien_x, alien_y, level, alien_count)
  if level == 1
    if alien_count == 1
      alien_x = 900
      alien_y = 50
    else
      alien_x -= 60 
    end
    return alien_x, alien_y
  elsif level == 2
    if alien_count == 1
      alien_x = 960
      alien_y = 50
    end
    if alien_count == 6
      alien_x = 300
    elsif alien_count == 11
      alien_x = 600
    elsif alien_count == 16
      alien_x = 600
      alien_y -= 45
    elsif alien_count == 21
      alien_x = 900
      alien_y -= 45
    # elsif alien_count == 36
    #   alien_x = 900
    #   alien_y -= 45
    else
      alien_x -= 60 
    end
    return alien_x, alien_y
  elsif level == 3
    if alien_count == 1
      alien_x = 960
      alien_y = 50
    elsif alien_count == 
    end
  # elsif level == 4
  # elsif level == 5
  # elsif level == 6
  # elsif level == 7
  # elsif level == 8
  # elsif level == 9
  # elsif level == 10
  else #delete this after all levels are complete
    alien_x -= 60 
    if alien_count % 15 == 0 ### doesn't apply for first lvl
      alien_x = alien_x + 900
      alien_y -= 45
    end
    return alien_x, alien_y
  end
end


def add_targets(level) 
  if level == 2
    alien_count = 35
  elsif level == 3
    alien_count = 27
  else 
    alien_count = 35
  end
  return alien_count
end


##### Position Guide ######
/
default y = 50, new line -= 45
x values (right to left)
1 = 900
2 = 840
3 = 780
4 = 720
5 = 660
6 = 600
7 = 540
8 = 480
9 = 420
10 = 360
11 = 300
12 = 240
13 = 180
14 = 120
15 = 60

/