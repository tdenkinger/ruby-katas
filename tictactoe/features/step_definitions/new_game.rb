require_relative "../../lib/tictactoe.rb"

Given /^This is a fresh game$/ do
  @game = TicTacToe.new
end

Then /^All of the spots are empty$/ do
  @game.is_board_clear?.should be true
end

Then /^Player (\d+) should have no chosen squares$/ do |arg1|
  @game.is_player_clear?("player_#{arg1}").should be true
end
