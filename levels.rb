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
  elsif level == 6
    if count == 1
      x = 780
      y = 50
    elsif count == 2
      x = 600
    elsif count == 7
      x = 780
      y -= 45
    elsif count == 8
      x = 600
    elsif count == 13
      x = 780
      y -= 45
    elsif count == 14
      x = 840
    elsif count == 17
      x = 600
    elsif count == 22
      x = 840
      y -= 45
    elsif count == 25
      x = 540
    elsif count == 28
      x = 480
      y -= 45
    elsif count == 29
      x = 180
      y -= 90
    elsif count == 32
      x = 180
      y -= 45
    elsif count == 35
      x = 180
      y -= 45
    else
      x -= 60
    end
    return x, y
  elsif level == 7
    if count == 1
      x = 780
      y = 50
    elsif count == 2
      x = 180
    elsif count == 3
      x = 840
      y -= 45
    elsif count == 6
      x = 240
    elsif count == 9
      x = 900
      y -= 45
    elsif count == 14
      x = 300
    elsif count == 19
      x = 480
      y -= 120
    elsif count == 20
      x = 540
      y -= 45
    elsif count == 23
      x = 600
      y -= 45
    elsif count == 28
      x = 660
      y -= 45
    else
      x -= 60
    end
    return x, y
  elsif level == 8
    if count == 1
      x = 840
      y = 0
    elsif count == 5
      x = 300
    elsif count == 9
      x = 840
      y -= 45
    elsif count == 13
      x = 300
    elsif count == 17
      x = 840
      y -= 45
    elsif count == 18
      x = 660
    elsif count == 19
      x = 300
    elsif count == 20
      x = 120
    elsif count == 21
      x = 540
      y -= 135
    elsif count == 24
      x = 600
      y -= 45
    elsif count == 25
      x = 360
    elsif count == 26
      x = 600
      y -= 45
    elsif count == 27
      x = 360
    else
      x -= 60
    end
    return x, y
  elsif level == 9   
    if count == 1
      x = 840
      y = 0
    elsif count == 3
      x = 180
    elsif count == 5
      x = 780
      y -= 45
    elsif count == 7
      x = 240
    elsif count == 9
      x = 720
      y -= 45
    elsif count == 11
      x = 300
    elsif count == 13
      x = 660
      y -= 45
    elsif count == 15
      x = 360
    elsif count >= 16 && count <= 24
      x = 480
      y -= 45
    elsif count == 25
      x = 840
      y -= 90
    elsif count == 29
      x = 240
    else
      x -= 60
    end
    return x, y
  elsif level == 10
    if count == 1
      x = 480
      y = 50
    elsif count == 2
      x = 540
      y -= 45
    elsif count == 3
      x = 420
    elsif count == 4
      x = 600
      y -= 45
    elsif count == 5
      x = 360
    elsif count == 6
      x = 660
      y -= 45
    elsif count == 7
      x = 300
    elsif count == 8
      x = 720
      y -= 45
    elsif count == 9
      x = 240
    elsif count == 10
      x = 720
      y -= 45
    elsif count == 11
      x = 240
    elsif count == 12
      x = 720
      y -= 45
    elsif count == 13
      x = 240
    elsif count == 14
      x = 660
      y -= 45
    elsif count == 15
      x = 300
    elsif count == 16
      x = 600
      y -= 45
    elsif count == 17 ##good until here. maybe go flat next?
      x = 360
    elsif count == 18
      x = 540
    elsif count == 19
      x = 420
    elsif count == 20
      x = 480
      y += 45
    else
      x -= 60
    end
    return x, y
  else #delete this after all levels are complete
    if count == 1
      x = 900
      y = 0
    end
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
  elsif level == 6
    total = 37
  elsif level == 7
    total = 34
  elsif level == 8
    total = 27
  elsif level == 9
    total = 32
  elsif level == 10
    total = 20
  else 
    total = 100
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