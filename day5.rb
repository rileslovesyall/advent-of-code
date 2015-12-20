require "./inputs/day5_input.rb"

def naughty_or_nice(string)
  string = string.split('')
  # contains at least three vowels
  vowels = 0
  string.each do |letter|
    case letter
    when 'a'
      vowels += 1
    when 'e'
      vowels += 1
    when 'i'
      vowels += 1
    when 'o'
      vowels += 1
    when 'u'
      vowels += 1
    end
  end
  # contains at least one letter that appears twice as a row
  double = false
  string.each_with_index do |letter, index|
    double = true if letter == string[index+1]
  end
  # does not contain 'ab', 'cd', 'pq', 'xy'
  forbidden = false
  forbidden = true if string.include?('ab') || string.include?('cd') || string.include?('pq') || string.include?('xy')
  if forbidden == false && double == true && vowels == 3
    return 'nice'
  else
    return 'naughty'
  end
end

puts "'ugknbfddgicrmopn' is nice. test: #{naughty_or_nice('ugknbfddgicrmopn')}"
puts "'aaa' is nice. test: #{naughty_or_nice('aaa')}"
puts "'jchzalrnumimnmhp' is naughty. test: #{naughty_or_nice('jchzalrnumimnmhp')}"
puts "'haegwjzuvuyypxyu' is naughty. test: #{naughty_or_nice('haegwjzuvuyypxyu')}"
puts "'dvszwmarrgswjxmb' is naughty. test: #{naughty_or_nice('dvszwmarrgswjxmb')}"
