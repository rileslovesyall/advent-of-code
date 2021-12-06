require_relative "./lib/bingo.rb"
require 'pry'

TEST_DRAWS = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
INPUT_DRAWS = [17,25,31,22,79,72,58,47,62,50,30,91,11,63,66,83,33,75,44,18,56,81,32,46,93,13,41,65,14,95,19,38,8,35,52,7,12,70,84,23,4,42,90,60,6,40,97,16,27,86,5,48,54,64,29,67,26,89,99,53,34,0,57,3,92,37,59,9,21,78,51,80,73,82,76,28,88,96,45,69,98,1,2,71,68,49,36,15,55,39,87,77,74,94,61,85,10,43,20,24]


def prepare_game(bingo, input, draws)
	board_array = []
	bingo.draws = draws
	line_array = []
	File.readlines(input).each do |line|
		line = line.chomp.gsub(/\s+/, "")
		arr = []
		line.each_char do |c|
			arr << c
		end
		line_array << arr
	end

	while line_array.length > 0
		bingo.add_board(line_array.shift(5))
		line_array.shift(1)
	end

end

#Set up the script
game = SquidBingo.new
prepare_game(game, './inputs/day4_test.txt', TEST_DRAWS)
puts "Bingo boards: #{game.boards}"
puts "There are #{game.boards.length} boards in the game."




