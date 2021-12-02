require 'pry'

def count_distance(input)
  last_line = 0
  greater = 0

  File.readlines(input).each do |line|
    last_line = line if last_line == 0 
    greater+= 1 if last_line.to_i < line.to_i
    last_line = line
  end

  puts "Increased: #{greater}"

end

def sliding_window(input)
  window = Array.new

  greater = 0
  sum_first = 0
  sum_second = 0

  File.readlines(input).each do |line|
    if window.length < 3
      window. << line.to_i
      next
    end
      
    sum_first = window.sum
    window.shift
    window << line.to_i
    sum_second = window.sum
    greater+= 1 if sum_second > sum_first
  end

  puts "Increased: #{greater}"

end

count_distance('./inputs/day1_inputs.txt')
sliding_window('./inputs/day1_inputs.txt')

