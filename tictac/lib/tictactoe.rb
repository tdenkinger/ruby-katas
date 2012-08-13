class TicTacToe
  attr_reader :board, :players

  def initialize
    @board = [0,1,2,3,4,5,6,7,8]
    @players = {player_1: [], player_2: []}
  end
 
  def take_square(player, square)
    @players[player.to_sym] << square
    @players[player.to_sym].sort!
    @board[square] = nil
  end

  def is_square_owner?(player, square)
    @players[player.to_sym].include?(square) ? true : false
  end

  def is_square_available?(square)
    @board[square].nil? ? false : true
  end
  
  def is_board_clear?
    return true if @board.count == 9
    false
  end

  def player_squares(player_number)
    @players["player_#{player_number}"]
  end
  
end


