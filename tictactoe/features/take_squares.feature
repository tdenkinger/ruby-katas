Feature: Players claim squares in turn

  Scenario: Player 1 takes the first square
    Given This is a new game
    When Player 1 takes a square
    Then Player 1 owns the square

  Scenario: Player 1 takes the first square
    Given This is a new game
    When Player 1 takes a square
    Then The taken square is no long available

  Scenario: Player 2 takes a square
    Given Player 1 has taken a square 
    When Player 2 takes a square
    Then Player 2 owns the square

  Scenario: Player 2 takes a square
    Given Player 1 has taken a square 
    When Player 2 takes a square
    Then The taken square is no longer available 


