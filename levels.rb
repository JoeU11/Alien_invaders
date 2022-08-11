require_relative 'alien.rb'

def update_alien_position(x, y, level, count)
  if level == 1
    if count == 1
      x = 900
      y = 50
    else
      x -= 60 
    end
    return x, y
  elsif level == 2
    if count == 1
      x = 960
      y = 50
    end
    if count == 6
      x = 300
    elsif count == 11
      x = 600
    elsif count == 16
      x = 600
      y -= 45
    elsif count == 21
      x = 900
      y -= 45
    # elsif count == 36
    #   x = 900
    #   y -= 45
    else
      x -= 60 
    end
    return x, y
  elsif level == 3
    if count == 1
      x = 660
      y = 50
    elsif count == 8
      x = 600
      y -= 45
    elsif count == 13
      x = 900
      y -= 45
    elsif count == 17
      x = 240
    elsif count == 21
      x = 660
      y -= 45
    else
      x -= 60
    end
    return x, y
  elsif level == 4
    if count == 1
      x = 720
      y = 50
    elsif count == 4
      x = 360
    elsif count == 7
      x = 660
      y -= 45
    elsif count == 14
      x = 600
      y -= 45
    elsif count == 19
      x = 540
      y -= 45
    elsif count == 22
      x = 780
      y -= 45
    elsif count == 33
      x = 480
      y -= 45
    elsif count == 34
      x = 540
      y -= 45
    elsif count == 37
      x = 540
      y -= 45
    else
      x -= 60
    end
    return x, y
  elsif level == 5
    if count == 1
      x = 480
      y = 50
    elsif count == 2
      x = 540
      y -= 45
    elsif count == 5
      x = 600
      y -= 45
    elsif count == 10
      x = 660
      y -= 45
    elsif count == 17
      x = 720
      y -= 45
    elsif count == 26
      x = 780
      y -= 45
    else
      x -= 60
    end
    return x, y
  # elsif level == 6
  # elsif level == 7
  # elsif level == 8
  # elsif level == 9
  # elsif level == 10
  else #delete this after all levels are complete
    x -= 60 
    if count % 15 == 0 ### doesn't apply for first lvl
      x = x + 900
      y -= 45
    end
    return x, y
  end
end


def add_targets(level) 
  if level == 2
    total = 35
  elsif level == 3
    total = 27
  elsif level == 4
    total = 39
  elsif level == 5
    total = 36
  else 
    total = 35
  end
  return total
end


##### Position Guide ######
/
default y = 50, new line -= 45
x values (right to left), new target -= 60 (same line)
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