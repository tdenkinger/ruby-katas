class TicTacToe
  attr_reader :board, :players

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]   
    @players = { :player_1 => [], :player_2 => []}

    @winning_combos = [ "012", "345", "678", "036", "147", "258", "048", "246" ]
  end

  def take_spot(player, spot_index)
    return "Spot is already taken, choose again" if @board[spot_index].nil?
    @players[player] << spot_index 
    @players[player].sort!
    @board[spot_index] = nil
    return "#{player} wins!" if is_winner?(player)
    # return "The cat gets the game" if is_hung? 
  end

  private

  # def is_hung?
    # false
  # end
  
  def is_winner?(player)
    status = false
    players[player].combination(3).to_a.each do | combo |
      status = true if @winning_combos.include?(combo.join)
    end
    status 
  end
end
