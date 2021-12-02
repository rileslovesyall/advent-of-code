require 'pry'

def navigate(input)

	horizontal = 0
	depth = 0

	File.readlines(input).each do |line|
    	distance = line.gsub(/[^\d]/, '')
    	direction = line.gsub(/[^a-zA-Z]/, '')

    	if direction == "forward"
    		horizontal += distance.to_i
    	elsif direction == "up"
    		depth -= distance.to_i
		elsif direction == "down"
			depth += distance.to_i
		end

  	end
  	multipled = horizontal * depth
  	puts "Horizontal: #{horizontal}"
  	puts "Depth: #{depth}"
  	puts "Multipled: #{multipled}"
end

def navigate_with_aim(input)
	aim = 0
	horizontal = 0
	depth = 0

	File.readlines(input).each do |line|
    	distance = line.gsub(/[^\d]/, '')
    	direction = line.gsub(/[^a-zA-Z]/, '')

    	if direction == "forward"
    		horizontal += distance.to_i
    		depth += aim * distance.to_i
    	elsif direction == "up"
    		aim -= distance.to_i
		elsif direction == "down"
			aim += distance.to_i
		end

  	end
  	multipled = horizontal * depth
  	puts "Horizontal: #{horizontal}"
  	puts "Depth: #{depth}"
  	puts "Multipled: #{multipled}"
end




# navigate('./inputs/day2_test.txt')
# navigate('./inputs/day2_input.txt')

# navigate_with_aim('./inputs/day2_test.txt')
# navigate_with_aim('./inputs/day2_input.txt')