require_relative 'alien.rb'

def update_alien_position(alien_x, alien_y, level, alien_count)
  # if level == 1
  alien_x -= 60
  p alien_count
  if alien_count % 15 == 0
    alien_x = alien_x + 900
    alien_y -= 45
  end
  return alien_x, alien_y
  # elsif level == 2
  # elsif level == 3
  # elsif level == 4
  # elsif level == 5
  # elsif level == 6
  # elsif level == 7
  # elsif level == 8
  # elsif level == 9
  # elsif level == 10
  # end
end
