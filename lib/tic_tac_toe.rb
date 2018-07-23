class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    str.to_i - 1
  end

  def move(idx, token = "X")
    @board[idx] = token
  end

  def position_taken?(idx)
    return false if @board[idx] == " "
    true
  end

  def valid_move?(idx)
    return false if position_taken?(idx) || idx > 8 || idx < 0
    true
  end

  def turn_count
    @board.count {|el| el != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    state = false
    until state
      puts "Please enter your turn : 1-9"
      input = input_to_index(gets.chomp)
      if valid_move?(input)
        move(input, current_player)
        state = true
      else
        next
      end
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |com|
      return com if position_taken?(com[0]) && @board[com[0]] ==  @board[com[1]] && @board[com[0]] == @board[com[2]]
    end
    false
  end

  def full?
    return true if @board.each_index.all? {|idx| position_taken?(idx)} && !won?
    false
  end

  def draw?
    return true if full? && !won?
    false
  end

  def over?
    return true if draw? || full? || won?
    false
  end

  def winner
    return @board[won?[0]] if won?
    nil
  end

  def play
    until over?
      turn
    end
  end


end
