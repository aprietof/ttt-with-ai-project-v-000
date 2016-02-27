require 'pry'

class Board

  #has an attribute to store the cells of the board
  attr_accessor :board, :cells

  
  # sets the cells of the board to a 9 element array of " "
  def initialize
    @cells = Array.new(9, " ")
  end

  # can reset the state of the cells in the board
  # sets the cells of the board to a 9 element array of " "
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  # prints the board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  # takes in user input and returns the value of the board cell
  def position(location)
    @cells[location.to_i - 1]
  end

  # returns true for a full board
  # returns false for an in-progress game
  def full?
    !@cells.include? " "
  end

  # returns the amount of turns based on cell value
  def turn_count
    @cells.select{|position| position != " "}.count
  end

  # returns true if the position is X or O
  # returns false if the position is empty or blank
  def taken?(location)
    position(location) != " "
  end

  # returns true for user input between 1-9 that is not taken
  def valid_move?(position)
    position.ord >= 48 && position.ord <= 57 ? !taken?(position) : false
  end

  # updates the cells in the board with the player token according to the input
  def update(location, player)
    @cells[location.to_i - 1] = player.token
  end

end