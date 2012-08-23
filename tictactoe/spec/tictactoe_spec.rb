require_relative "../lib/tictactoe.rb"

describe TicTacToe do
  let(:game){ TicTacToe.new }

  context "before any moves have been made" do
    context "the board" do
      it "has no taken squares" do
        game.is_board_clear?.should be true
      end
    end

    context "players" do
      it "Player 1 has taken no squares" do
        game.is_player_clear?(:player_1).should be true
      end

      it "Player 2 has taken no squares" do
        game.is_player_clear?(:player_2).should be true
      end
    end
  end

  context "after one pair of moves" do
    context "the board" do
      it "has 7 spots remaining" do
        expect {
          game.take_square(:player_1, 0)
          game.take_square(:player_2, 1)
        }.to change{game.number_of_unclaimed_spots}.by(-2)
      end
    end

    context "a player tries to take an unavailable square" do
      context "when the square has already been taken" do
        it "does not allow the player to have the square" do
          expect {
            game.take_square(:player_1, 5)
            game.take_square(:player_2, 5)
          }.to change{game.number_of_unclaimed_spots}.by(-1)
        end
      end

      context "when the square is not on the board" do
        it "does not add the square to the player" do
          game.take_square(:player_1, 15).should == "Square is not on the board"
          game.has_square?(:player_1, 15).should be false
        end

        it "does not remove a square from availability" do
          expect{
            game.take_square(:player_1, 15)
          }.to_not change{game.number_of_unclaimed_spots}
        end
      end
    end

    context "each player" do
      it "has one square" do
        game.take_square(:player_1, 0)
        game.take_square(:player_2, 1)
        game.has_square?(:player_1, 0).should == true
        game.has_square?(:player_2, 1).should == true
      end
    end
  end

  context "after one player has three spots" do
    context "the player has a non-winning set of spots" do
      it "the player does not win" do
        game.take_square(:player_1, 3).should == "no winner"
        game.take_square(:player_1, 0).should == "no winner"
        game.take_square(:player_1, 1).should == "no winner"
      end
    end

    context "The player has a winning set of spots" do
      it "the player wins" do
        game.take_square(:player_1, 0).should == "no winner"
        game.take_square(:player_1, 2).should == "no winner"
        game.take_square(:player_1, 1).should == "player_1 wins!"
      end
    end
  end

  context "after one player has four spots" do
    context "the player has a non-winning set of spots" do
      it "the player does not win" do
        game.take_square(:player_1, 3).should == "no winner"
        game.take_square(:player_1, 0).should == "no winner"
        game.take_square(:player_1, 1).should == "no winner"
        game.take_square(:player_1, 5).should == "no winner"
      end
    end

    context "The player has a winning set of spots" do
      it "the player wins" do
        game.take_square(:player_2, 0).should == "no winner"
        game.take_square(:player_2, 2).should == "no winner"
        game.take_square(:player_2, 5).should == "no winner"
        game.take_square(:player_2, 1).should == "player_2 wins!"
      end
    end
  end

  context "When alternating plays" do
    context "player 1" do
      it "wins" do
        game.take_square(:player_1, 0).should == "no winner"
        game.take_square(:player_2, 1).should == "no winner"
        game.take_square(:player_1, 4).should == "no winner"
        game.take_square(:player_2, 2).should == "no winner"
        game.take_square(:player_1, 6).should == "no winner"
        game.take_square(:player_2, 7).should == "no winner"
        game.take_square(:player_1, 8).should == "player_1 wins!"
      end
    end

    context "neither player can win" do
      it "the game is hung" do
        game.take_square(:player_1, 0).should == "no winner"
        game.take_square(:player_2, 4).should == "no winner"
        game.take_square(:player_1, 1).should == "no winner"
        game.take_square(:player_2, 2).should == "no winner"
        game.take_square(:player_1, 6).should == "no winner"
        game.take_square(:player_2, 7).should == "no winner"
        game.take_square(:player_1, 5).should == "no winner"
        game.take_square(:player_2, 3).should == "no winner"
        game.take_square(:player_1, 8).should == "The game is hung"
      end
    end
  end
end
