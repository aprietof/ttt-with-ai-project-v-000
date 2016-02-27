class Game
  # provides access to the board
  # provides access to player_1
  # provides access to player_2
  attr_accessor :board, :player_1, :player_2

  # defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  # accepts 2 players and a board
  # defaults to two human players, X and O, with am empty board
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # returns the correct player, X, for the third move
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  # returns true for a draw
  # returns true for a won game
  # returns false for an in-progress game
  def over?
    won? || draw? 
  end

  # returns false for a draw
  # returns true for a win
  def won?
    WIN_COMBINATIONS.any? do |win_array|
     board.cells[win_array[0]] == board.cells[win_array[1]] && board.cells[win_array[0]] == board.cells[win_array[2]] 
    end
  end

  # returns true for a draw
  # returns false for a won game
  # returns false for an in-progress game
  def draw?
    !won? && board.full?
  end


  # returns X when X won
  # returns O when O won
  def winner
    if won?
      winning_array = WIN_COMBINATIONS.detect do |win_array|
        board.cells[win_array[0]] == "X" && board.cells[win_array[1]] == "X" && board.cells[win_array[2]] == "X" or board.cells[win_array[0]] == "O" && board.cells[win_array[1]] == "O" && board.cells[win_array[2]] == "O"
      end
      # returns nil when no winner
      winning_array.nil? ? nil : board.cells[winning_array[0]]
    end
  end

  # makes valid moves
  def turn
    input = current_player.move(board)

    # asks for input again after a failed validation
    while !board.valid_move?(input)
      puts "Please enter a valid move: "
      input = current_player.move(board)
    end
    # changes to player 2 after the first turn
    board.update(input, current_player)
  end















end