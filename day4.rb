require "./inputs/day4_input.rb"
require "digest"

def advent_coins(input)
  # begin the string with a number
  string = "1"
  # use the Ruby MD5 digest-- I don't really understand this, but it does it's thing until the first five digits are 0
  while Digest::MD5.hexdigest("#{input}" + string)[0..4] != "00000"
    # increment the numbers by 1, so the first one it finds that fits the requirements will be the lowest
    string = string.succ
  end
  return string
end

def advent_coins_2(input)
  # begin the string with a number
  string = "1"
  # use the Ruby MD5 digest-- I don't really understand this, but it does it's thing until the first five digits are 0
  while Digest::MD5.hexdigest("#{input}" + string)[0..5] != "000000"
    # increment the numbers by 1, so the first one it finds that fits the requirements will be the lowest
    string = string.succ
  end
  return string
end

puts "For five zeros, the code is #{advent_coins(INPUT)}"
puts "For six zeros, the code is #{advent_coins_2(INPUT)}"