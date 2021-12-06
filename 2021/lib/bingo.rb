class SquidBingo
	attr_accessor :boards, :draws

	def initialize
		@boards = []
		@draws = []
	end
	

	def add_board(board_args)
		@boards << board_args
	end

	def play_game
		
	end

end