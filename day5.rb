require "./inputs/day5_input.rb"
class String

  def three_vowels?
    !(self.match(/[aeiou].*[aeiou].*[aeiou]/)).nil?
  end

  def double_letters?
    !(self.match(/([a-z])\1/)).nil?
  end

  def forbidden?
    !self.match(/ab|cd|pq|xy/).nil?
  end

  def nice?
    three_vowels? && double_letters? && !forbidden?
  end

end
# def naughty_or_nice(string)
#   string = string.split('')
#   # contains at least three vowels
#   vowels = 0
#   string.each do |letter|
#     case letter
#     when 'a'
#       vowels += 1
#     when 'e'
#       vowels += 1
#     when 'i'
#       vowels += 1
#     when 'o'
#       vowels += 1
#     when 'u'
#       vowels += 1
#     end
#   end
#   # contains at least one letter that appears twice as a row
#   double = false
#   string.each_with_index do |letter, index|
#     double = true if letter == string[index+1]
#   end
#   # does not contain 'ab', 'cd', 'pq', 'xy'
#   forbidden = false
#   forbidden = true if string.include?('ab') || string.include?('cd') || string.include?('pq') || string.include?('xy')
#   if forbidden == false && double == true && vowels == 3
#     return 'nice'
#   else
#     return 'naughty'
#   end
# end

def naughty_or_nice(string_of_strings)
  count = 0
  string_array = string_of_strings.split(" ")
  string_array.each do |string|
    count += 1 if string.nice?
  end
  return count
end

# def number_nice(string_of_strings)
#   count = 0
#   string_array = string_of_strings.split(" ")
#   string_array.each do |string|
#     count += 1 if naughty_or_nice(string) == 'nice'
#   end
#   return count
# end

puts INPUT.split(" ").length
puts "There are #{naughty_or_nice(INPUT)} nice words in the list."

puts "'xxxaeix' is nice. test: #{naughty_or_nice('xxxaeix')}"
puts "'ugknbfddgicrmopn' is nice. test: #{naughty_or_nice('ugknbfddgicrmopn')}"
puts "'aaa' is nice. test: #{naughty_or_nice('aaa')}"
puts "'jchzalrnumimnmhp' is naughty. test: #{naughty_or_nice('jchzalrnumimnmhp')}"
puts "'haegwjzuvuyypxyu' is naughty. test: #{naughty_or_nice('haegwjzuvuyypxyu')}"
puts "'dvszwmarrgswjxmb' is naughty. test: #{naughty_or_nice('dvszwmarrgswjxmb')}"


