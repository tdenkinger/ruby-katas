class TicTacToe
  attr_reader :board, :players

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]   
    @players = { :player_1 => [], :player_2 => []}

    @winning_combos = [ "012", "345", "678", "036", "147", "258", "048", "246" ]
  end

  def take_spot(player, spot_to_take)
    return "Spot is not on the board" if spot_to_take > @board.length 
    return "Spot is already taken, choose again" if @board[spot_to_take].nil?
    @players[player] << spot_to_take 
    @players[player].sort!
    @board[spot_to_take] = nil
    return "#{player} wins!" if is_winner?(player)
    return "The game is hung" if is_hung? 
  end

  def number_of_unclaimed_spots 
    board.compact.count
  end

  private

  def is_winner?(player)
    status = false
    players[player].combination(3).to_a.each do | combo |
      status = is_winning_combination?(combo.join)
      break if status 
    end
    status 
  end
  
  def is_hung?
    @board.compact.empty? ? true : false
  end
 
  def is_winning_combination?(combo)
    @winning_combos.include?(combo) ? true : false
  end
end
