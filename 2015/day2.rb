require './inputs/day2_input.rb'
require 'pry'

def paper_count(present_dimensions)
  sq_feet = []
  dimension_array = present_dimensions.split(" ")
  dimension_array.each do |dimension|
    present = dimension.split("x")
    l, w, h, = present.map(&:to_i)
    sq_feet << (2*l*w + 2*w*h + 2*h*l)
    sq_feet << [l*w, w*h, h*l].min
  end
  total_feet = sq_feet.inject(0) {|r, e| r + e}
  return total_feet
end

def ribbon_length(present_dimensions)
  feet = []
  dimension_array = present_dimensions.split(" ")
  dimension_array.each do |dimension|
    present = dimension.split("x")
    present.map!(&:to_i).sort!
    ribbon = present[0]*2 + present[1]*2
    bow = present[0]*present[1]*present[2]
    feet << ribbon
    feet << bow
  end
  total_feet = feet.inject(0) {|r, e| r + e}
  return total_feet
end

puts "The elves need to order #{paper_count(INPUT)} sq. feet of wrapping paper."

puts "The elves need to order #{ribbon_length(INPUT)} feet of ribbon."
