require "./inputs/day3_input.rb"

def houses__with_presents(radio_directions)
  house_map = radio_directions.split("")
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