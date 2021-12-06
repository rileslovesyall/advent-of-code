require 'pry'

def get_power_consumption(input)
	gamma_binary = get_gamma_rate(input)
	gamma_rate = gamma_binary.to_i(2)
	epsilon_binary = get_epsilon_rate(gamma_binary)
	epsilon_rate = epsilon_binary.to_i(2)
	power_consumption = gamma_rate * epsilon_rate
	puts "Gamma rate: #{gamma_rate}"
	puts "Epsilon rate: #{epsilon_rate}"
	puts "Epsilon binary: #{epsilon_binary}"
	puts "Gamma binay: #{gamma_binary}"
	puts "Power consumption: #{power_consumption}"
end


def get_gamma_rate(input)
	gamma_rate = ""
	first_pos = []
	second_pos = []
	third_pos = []
	fourth_pos = []
	fifth_pos = []
	sixth_pos = []
	seventh_pos = []
	eigth_pos = []
	nineth_pos = []
	tenth_pos = []
	eleventh_pos = []
	twelfth_pos = []

	File.readlines(input).each do |line|
	    first_pos << line[0]
	    second_pos << line[1]
	    third_pos << line[2]
	    fourth_pos << line[3]
	    fifth_pos << line[4]
	    sixth_pos << line[5]
	    seventh_pos << line[6]
	    eigth_pos << line[7]
	    nineth_pos << line[8]
	    tenth_pos << line[9]
	    eleventh_pos << line[10]
	    twelfth_pos << line[11]
    end

    gamma_rate.concat(get_median(first_pos).to_s)
    gamma_rate.concat(get_median(second_pos).to_s)
    gamma_rate.concat(get_median(third_pos).to_s)
    gamma_rate.concat(get_median(fourth_pos).to_s)
    gamma_rate.concat(get_median(fifth_pos).to_s)
    gamma_rate.concat(get_median(sixth_pos).to_s)
    gamma_rate.concat(get_median(seventh_pos).to_s)
    gamma_rate.concat(get_median(eigth_pos).to_s)
    gamma_rate.concat(get_median(nineth_pos).to_s)
    gamma_rate.concat(get_median(tenth_pos).to_s)
    gamma_rate.concat(get_median(eleventh_pos).to_s)
    gamma_rate.concat(get_median(twelfth_pos).to_s)

    return gamma_rate
end

def get_epsilon_rate(gamma_rate)
	epsilon_rate = ""
	gamma_rate.each_char { |c|
		epsilon_rate.concat(reverse_bit(c))
	}
	return epsilon_rate
end

def reverse_bit(bit)
	if bit.to_s == "0"
		return "1"
	else
		return "0"
	end
end

def get_median(array)
	sorted = array.sort
    len = sorted.length
    median = (sorted[(len-1)/2].to_i + sorted[len/2].to_i / 2)
end

def get_most(array)
	zero_count = 0
	one_count = 0
	len = array.length

	while zero_count <= array.length && one_count <= array.length
		array.each do |n|
			if n == "0"
				zero_count += 1
			else
				one_count += 1
			end
		end
	end

	if zero_count > one_count
		return "0"
	else
		return "1"
	end
end

def get_least(array)
	zero_count = 0
	one_count = 0
	len = array.length

	while zero_count <= array.length && one_count <= array.length
		array.each do |n|
			if n == "0"
				zero_count += 1
			else
				one_count += 1
			end
		end
	end

	if one_count < zero_count
		return "1"
	else
		return "0"
	end
end

def get_life_support(input)
	input_array = []
	File.readlines(input).each do |line|
		input_array << line.chomp
	end
	puts "Working on life support."

	ox_gen_rating_binary = get_oxygen_generator_rating(input_array)
	ox_gen_rating_dec = ox_gen_rating_binary.to_i(2)
	puts "Ox Gen Rating = #{ox_gen_rating_dec} or #{ox_gen_rating_binary}"

	co2_scrubber_rating_binary = get_co2_scrubber_rating(input_array)
	co2_scrubber_rating_dec = co2_scrubber_rating_binary.to_i(2)
	puts "CO2 Scrubber Rating = #{co2_scrubber_rating_dec} or #{co2_scrubber_rating_binary}"

	life_support_rating = ox_gen_rating_dec * co2_scrubber_rating_dec
	puts "Life suport rating: #{life_support_rating}"
end

def get_oxygen_generator_rating(input_array)
	passing_bits = []
	bit_length = input_array[0].length
	position = 0
	bit_length.times do
		if input_array.length > 1 
			nums_in_current_position = []
			input_array.each { |n|
				nums_in_current_position << n[position]
			}
			bit_criteria = get_most(nums_in_current_position)
			input_array.each { |n|
				if n[position].to_s == bit_criteria.to_s && input_array.length > 0
					passing_bits << n
				end
			}
			input_array = passing_bits
			passing_bits = []
		end
		position += 1
	end	
	return input_array[0]
end

def get_co2_scrubber_rating(input_array)
	passing_bits = []
	bit_length = input_array[0].length
	position = 0
	bit_length.times do
		if input_array.length > 1 
			nums_in_current_position = []
			input_array.each { |n|
				nums_in_current_position << n[position]
			}
			bit_criteria = get_least(nums_in_current_position)
			input_array.each { |n|
				if n[position].to_s == bit_criteria.to_s && input_array.length > 0
					passing_bits << n
				end
			}
			input_array = passing_bits
			passing_bits = []
		end
		position += 1
	end	
	return input_array[0]
end


# get_power_consumption('./inputs/day3_test.txt')
# get_power_consumption('./inputs/day3_input.txt')
# get_life_support('./inputs/day3_test.txt')
get_life_support('./inputs/day3_input.txt')