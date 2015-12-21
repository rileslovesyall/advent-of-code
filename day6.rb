require './inputs/day6_input.rb'

def light_show(directions)
  lights = Array.new(1000) {Array.new(1000) {0}}
  directions = directions.split("\n")
  directions.each do |direction|
    numbers = direction.gsub(/[a-z]/, "")
    numbers = numbers.split(" ")
    first = numbers[0].split(",")
    x1 = first[0].to_i
    y1 = first[1].to_i
    second = numbers[1].split(",")
    x2 = second[0].to_i
    y2 = second[1].to_i
    if direction.match(/turn\son/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] = 1
        end
      end
    elsif direction.match(/turn\soff/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] = 0
        end
      end
    elsif direction.match(/toggle/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] =  1 - lights[x][y]
        end
      end
    end
  end
  return lights.flatten.reject{|l| l == 0 }.length
end

def light_show_with_brightness(directions)
  lights = Array.new(1000) {Array.new(1000) {0}}
  directions = directions.split("\n")
  directions.each do |direction|
    numbers = direction.gsub(/[a-z]/, "")
    numbers = numbers.split(" ")
    first = numbers[0].split(",")
    x1 = first[0].to_i
    y1 = first[1].to_i
    second = numbers[1].split(",")
    x2 = second[0].to_i
    y2 = second[1].to_i
    if direction.match(/turn\son/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] += 1
        end
      end
    elsif direction.match(/turn\soff/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] -= 1 if lights[x][y] > 0
        end
      end
    elsif direction.match(/toggle/)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          lights[x][y] += 2
        end
      end
    end
  end
  return lights.flatten.inject(0){|r, e| r + e}
end

puts "For your light show, you have #{light_show(INPUT)} lights lit. Good job!"
puts "For your brightness based light show, you have #{light_show_with_brightness(INPUT)} total brightness of lights. Thanks, Santa."