class TicTacToe
  def initialize
    @board = (0..8).to_a
    @total_number_of_squares = @board.length
    @winning_combos = [ "012", "345", "678", "036", "147", "258", "048", "246" ]

    @players = { :player_1 => [], :player_2 => []}
  end

  def take_square(player, square_to_take)
    square_is_available, message = is_square_available?(square_to_take)
    if square_is_available
      give_player_square(player, square_to_take)
      update_board(square_to_take)
      message = test_for_winner(player)
    end
    message
  end

  def update_board(square)
    @board.delete(square)
  end

  def give_player_square(player, square)
    @players[player] << square
    @players[player].sort!
  end

  def test_for_winner(player)
    messages = { winner:    "#{player} wins!",
                 hung:      "The game is hung",
                 no_winner: "no winner"}

    return messages[:winner] if is_winner?(player)
    return messages[:hung]   if is_hung?
    messages[:no_winner]
  end

  def is_square_available?(square_to_take)
    messages = {not_on_board: "Square is not on the board",
                taken:        "Square is already taken, choose again"}

    return false, messages[:not_on_board] if square_to_take > @total_number_of_squares
    return false, messages[:taken]        unless @board.include?(square_to_take)
    true
  end

  def number_of_unclaimed_spots
    @board.count
  end

  def is_winner?(player)
    status = false
    @players[player].combination(3).to_a.each do | combo |
      status = is_winning_combination?(combo.join)
      break if status
    end
    status
  end

  def is_hung?
    @board.empty? ? true : false
  end

  def is_winning_combination?(combo)
    @winning_combos.include?(combo) ? true : false
  end

  def is_player_clear?(player)
    @players[player].count == 0 ? true : false
  end

  def is_board_clear?
    number_of_unclaimed_spots == @board.count ? true : false
  end

  def has_square?(player, square)
    @players[player].index(square) ? true : false
  end
end
