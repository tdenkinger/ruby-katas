Feature: Setup a new game

  Scenario: When a new game is started
    Given This is a fresh game
    Then All of the spots are empty
  
  Scenario: When a new game is started
    Given This is a fresh game
    Then Player 1 should have no chosen squares
    And Player 2 should have no chosen squares

