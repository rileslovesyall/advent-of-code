require "./inputs/day3_input.rb"

def houses__with_presents(radio_directions)
  house_map = [[]]
end

test = ">"
square_test = "^>v<"
two_house_test = "^v^v^v^v^v"


puts "#{houses__with_presents(test)} should be 2 houses."
puts "#{houses__with_presents(square_test)} should be 4 houses."
puts "#{houses__with_presents(two_house_test)} should be 2 houses."
puts "#{houses__with_presents(INPUT)} houses get at least one present."