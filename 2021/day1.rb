def count_distance(input)
  last_line = 0
  greater = 0
  lesser = 0

  File.readlines(input).each do |line|
    last_line = line if last_line == 0 
    greater+= 1 if last_line.to_i < line.to_i
    last_line = line
  end

  puts "Increased: #{greater}"

end

count_distance('./inputs/day1_inputs.txt')