When /^Player (\d+) takes a square giving him a winning combination$/ do |arg1|
  @game = TicTacToe.new
  @game.take_square("player_#{arg1}".to_sym, 0)
  @game.take_square("player_#{arg1}".to_sym, 1)
  @message = @game.take_square("player_#{arg1}".to_sym, 2)
end

Then /^The game should declare player (\d+) the winner$/ do |arg1|
  @message.should == 'player_1 wins!'
end

When /^Player (\d+) takes a square that leaves no winning combinations available$/ do |arg1|
  @game = TicTacToe.new(1)
end

Then /^The game should end and declare it is hung$/ do
  message = @game.take_square(:player_1, 0)
  message.should == 'The game is hung'
end
