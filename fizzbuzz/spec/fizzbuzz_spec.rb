describe Fizzbuzz do
  before(:each) do
    @fb = Fizzbuzz.new
  end

  context "when given a number not divisible by 3, 5 or 15" do
    it "says the number" do
      @fb.says(1).should == 1
      @fb.says(37).should == 37 
    end
  end

  context "when given a non-integer value" do
    it "says it needs an integer" do
      @fb.says("hello world!").should == "That's not an integer, bub." 
    end
  end

  context "when given a number divisible by 3, 5, or 15" do
    it "says 'fizz' when the number is divisible by 3" do
      @fb.says(3).should == 'fizz'
    end
    
    it "says 'buzz' when the number is divisible by 5" do
      @fb.says(5).should == 'buzz'
    end

    it "says 'fizzbuzz' when the number is divisible by 15" do
      @fb.says(15).should == 'fizzbuzz'
    end
  end
end
