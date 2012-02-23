describe TicTacToe do
  let(:t){ TicTacToe.new }

  context "before any moves have been made" do
    context "the board" do
      it "has a full bag of spots" do
        t.board.count.should == 9
      end
    end
  
    context "player 1" do
      it "has an empty bag" do
        t.players[:player_1].empty?.should be true 
      end
    end 

    context "player 2" do
      it "has an empty bag" do
        t.players[:player_2].empty?.should be true
      end
    end 
  end

  context "after one pair of moves" do
    context "the board" do
      it "has 7 spots remaining" do
        t.take_spot(:player_1, 0)
        t.take_spot(:player_2, 1)
        t.board.compact.count.should == 7
      end
    end
    
    context "player 1 trieds to take an occupied spot" do
      it "does not add the spot to the player" do
        t.take_spot(:player_1, 5)
        t.take_spot(:player_1, 5)
        t.players[:player_1].count.should == 1
        t.board.compact.count.should == 8
      end
    end 

    context "the players" do
      it "has one spot each" do
        t.take_spot(:player_1, 0)
        t.take_spot(:player_2, 1)
        t.players[:player_1].count.should == 1
        t.players[:player_2].count.should == 1
      end
    end 
  end
 
  context "after one player has three spots" do
    context "the player has a non-winning set of spots" do
      it "the player does not win" do
        t.take_spot(:player_1, 3).should == nil
        t.take_spot(:player_1, 0).should == nil
        t.take_spot(:player_1, 1).should == nil
      end
    end

    context "The player has a winning set of spots" do
      it "the player wins" do
        t.take_spot(:player_1, 0).should == nil
        t.take_spot(:player_1, 2).should == nil
        t.take_spot(:player_1, 1).should == "player_1 wins!" 
      end
    end
  end 

  context "after one player has four spots" do
    context "the player has a non-winning set of spots" do
      it "the player does not win" do
        t.take_spot(:player_1, 3).should == nil
        t.take_spot(:player_1, 0).should == nil
        t.take_spot(:player_1, 1).should == nil
        t.take_spot(:player_1, 5).should == nil
      end
    end

    context "The player has a winning set of spots" do
      it "the player wins" do
        t.take_spot(:player_2, 0).should == nil
        t.take_spot(:player_2, 2).should == nil
        t.take_spot(:player_2, 5).should == nil
        t.take_spot(:player_2, 1).should == "player_2 wins!"
      end
    end
  end
  
  context "When alternating plays" do
    context "Player 1" do
      it "wins" do
        t.take_spot(:player_1, 0).should == nil
        t.take_spot(:player_2, 1).should == nil
        t.take_spot(:player_1, 4).should == nil
        t.take_spot(:player_2, 2).should == nil
        t.take_spot(:player_1, 6).should == nil
        t.take_spot(:player_2, 7).should == nil
        t.take_spot(:player_1, 8).should == "player_1 wins!" 
      end
    end
  end
end
