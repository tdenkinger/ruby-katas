require_relative "../../lib/tictactoe"

Given /^This is a new game$/ do
  @game = TicTacToe.new
end

When /^Player (\d+) takes a square$/ do |arg1|
  @game.take_square("player_#{arg1}", 0)
end

Then /^Player (\d+) owns the square$/ do |arg1|
  @game.is_square_owner?("player_#{arg1}", 0).should be true
end

Then /^The taken square is no long available$/ do
  @game.is_square_available?(0).should be false
end

Given /^Player (\d+) has taken a square$/ do |arg1|
  @game.is_square_owner?("player_#{arg1}", 0).should be true
end

Then /^The taken square is no longer available$/ do
    pending # express the regexp above with the code you wish you had
end
