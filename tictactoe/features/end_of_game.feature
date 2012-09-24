Feature: The game should know when it comes to an end

  Scenario: A player has a winning set of squares
    When Player 1 takes a square giving him a winning combination
    Then The game should declare player 1 the winner

  Scenario: There is no way for a player to win
    When Player 1 takes a square that leaves no winning combinations available
    Then The game should end and declare it is hung
