require './inputs/day1_input.rb'

def count_floors(string)
  string_arr = string.split("")
  floor = 0
  string_arr.each do |paren|
    if paren == "("
      floor += 1
    elsif paren == ")"
      floor -= 1
    end
  end
  return floor
end

puts count_floors(INPUT)
