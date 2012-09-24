require_relative "../../lib/tictactoe"

Given /^This is a new game$/ do
  @game = TicTacToe.new
end

When /^Player (\d+) takes a square$/ do |arg1|
  @game.take_square("player_#{arg1}".to_sym, 0)
end

Then /^Player (\d+) owns the square$/ do |arg1|
  @game.has_square?("player_#{arg1}".to_sym, 0).should be true
end

Then /^The taken square is no long available$/ do
  available, message = @game.is_square_available?(0)
  available.should be false
end

