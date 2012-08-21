require "Fizzbuzz"

describe "Fizzbuzz" do
  before do
    @fb = Fizzbuzz.new
  end

  context "when given a value that is not a number" do
    it "give a helpful message" do
      @fb.says("what am i").should == "Not a number"
    end
  end

  context "when given a number NOT divisible by 3, 5 or 15" do
    it "says the number" do
      @fb.says(1).should == 1
      @fb.says(2).should == 2
    end
  end

  context "when given a number divisible by 3, 5 or 15" do
    it "says 'fizz' if the number is divisible by 3" do
      @fb.says(3).should == 'fizz'
    end

    it "says 'buzz' if the number is divisible by 5" do
      @fb.says(5).should == 'buzz'
    end

    it "says 'fizzbuzz' if the number is divisible by 15" do
      @fb.says(15).should == 'fizzbuzz'
    end
  end
end
