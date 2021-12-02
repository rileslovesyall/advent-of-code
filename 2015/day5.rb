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

  # second half of the problem-- new requirements

  def pair_not_overlapping?
    !(self.match(/([a-z][a-z]).*\1/)).nil?
  end

  def repeat_with_middle_letter?
    !(self.match(/([a-z])[a-z]\1/)).nil?
  end

  def new_nice?
    pair_not_overlapping? && repeat_with_middle_letter?
  end

end

def naughty_or_nice(string_of_strings)
  count = 0
  string_array = string_of_strings.split(" ")
  string_array.each do |string|
    count += 1 if string.nice?
  end
  return count
end

def naughty_or_new_nice(string_of_strings)
  count = 0
  string_array = string_of_strings.split(" ")
  string_array.each do |string|
    count += 1 if string.new_nice?
  end
  return count
end

puts "There are #{naughty_or_nice(INPUT)} nice words in the list."

puts "There are #{naughty_or_new_nice(INPUT)} new-nice words in the list."


