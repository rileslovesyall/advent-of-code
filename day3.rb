require "./inputs/day3_input.rb"

def houses__with_presents(directions)
  house_map = directions.split("")
  visited_houses = [[0,0]]
  # starting coordinates
  x = 0
  y = 0
  house_map.each do |direction|
    if direction == "^"
      y += 1
    elsif direction == "v"
      y -= 1
    elsif direction == "<"
      x -= 1
    elsif direction == ">"
      x += 1
    end
    visited_houses << [x, y]
  end
  return visited_houses.uniq.length
end

test = ">"
square_test = "^>v<"
two_house_test = "^v^v^v^v^v"


puts "#{houses__with_presents(test)} should be 2 houses."
puts "#{houses__with_presents(square_test)} should be 4 houses."
puts "#{houses__with_presents(two_house_test)} should be 2 houses."
puts "#{houses__with_presents(INPUT)} houses get at least one present."

def robo_santa_houses(directions)
  house_map = directions.split("")
  visited_houses = [[0,0]]
  # starting coordinates
  x = 0
  y = 0
  # robo-santa starting coordinates
  r_x = 0
  r_y = 0
  house_map.each_with_index do |direction, index|
    if index % 2 == 0
      if direction == "^"
        y += 1
      elsif direction == "v"
        y -= 1
      elsif direction == "<"
        x -= 1
      elsif direction == ">"
        x += 1
      end
      visited_houses << [x, y]
    else
      if direction == "^"
        r_y += 1
      elsif direction == "v"
        r_y -= 1
      elsif direction == "<"
        r_x -= 1
      elsif direction == ">"
        r_x += 1
      end
      visited_houses << [r_x, r_y]
    end
  end
  return visited_houses.uniq.length
end

test1 = "^v"
test2 = "^>v<"
test3 = "^v^v^v^v^v"


puts "With Robo-Santa, this test: #{robo_santa_houses(test1)} should be 3 houses."
puts "With Robo-Santa, this test: #{robo_santa_houses(test2)} should be 3 houses."
puts "With Robo-Santa, this test: #{robo_santa_houses(test3)} should be 11 houses."
puts "With Robo-Santa and the real directions, #{robo_santa_houses(INPUT)} houses get at least one present."