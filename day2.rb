require './inputs/day2_input.rb'
require 'pry'

def paper_count(present_dimensions)
  feet = []
  dimension_array = present_dimensions.split(" ")
  dimension_array.each do |dimension|
    present = dimension.split("x")
    l, w, h, = present.map(&:to_i)
    feet << (2*l*w + 2*w*h + 2*h*l)
    feet << [l*w, w*h, h*l].min
  end
  total_feet = feet.inject(0) {|r, e| r + e}
  return total_feet
end

puts paper_count(INPUT)