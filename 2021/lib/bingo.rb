class SquidBingo
	attr_accessor :boards, :draws

	def initialize
		@boards = []
		@draws = []
		@last_draw = 0
	end
	

	def add_board(board_args)
		@boards << board_args
	end

	def draw_a_number
		draw = @draws.shift.to_s
		@boards.each do |board|
			board.each do |row|
				row.map! { |x| x == draw ? 'X' : x  }
			end
		end
		@last_draw = draw
	end

	def check_wins
		@boards.each do |board|
			col_hash = {}
			board.each do |row|
				row_fail = 0
				row.each_with_index do |num, index|
					if col_hash[index] == nil
						# binding.pry
						col_hash[index] = 0
					end
					if num != 'X'
						col_hash[index] += 1 
					end
					row_fail += 1 if num != 'X'
				end
				if row_fail == 0
					puts "We have a winner! The rows are all checked off! "
					# puts "This board is the winner: #{board}"
					score = count_win(board)
					puts "Board score is #{score}"
					return true
				end
			end
			col_hash.each_value do |val|
				if val == 0
					puts "We have a winner! The columns are all checked off!"
					# puts "This board is the winner: #{board}"
					score = count_win(board)
					puts "Board score is #{score}"
					return true
				end
			end
		end
		# binding.pry
		puts "No winners yet. Keep drawing."
		return false
	end

	def remove_wins
		@boards.each do |board|
			col_hash = {}
			board.each do |row|
				row_fail = 0
				row.each_with_index do |num, index|
					if col_hash[index] == nil
						# binding.pry
						col_hash[index] = 0
					end
					if num != 'X'
						col_hash[index] += 1 
					end
					row_fail += 1 if num != 'X'
				end
				if row_fail == 0
					@boards.delete(board)
					puts "Removed a winner."
				end
			end
			col_hash.each_value do |val|
				if val == 0
					@boards.delete(board)
					puts "Removed a winner."
				end
			end
		end
	end



	def count_win(board)
		count = 0
		board.each do |row|
			row.each do |num|
				count += num.to_i if num != 'X'
			end
		end
		score = count * @last_draw.to_i
		puts "Winning score is #{score}"
		return score
	end

end