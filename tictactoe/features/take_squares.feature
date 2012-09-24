Feature: Players claim squares in turn

  Scenario: Player 1 takes the first square
    Given This is a new game
    When Player 1 takes a square
    Then Player 1 owns the square

  Scenario: Player 1 takes the first square
    Given This is a new game
    When Player 1 takes a square
    Then The taken square is no long available

