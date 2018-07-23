class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [1, 4, 8],
    [2, 4, 6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

end
