class Transformer
  attr_reader :orderer, :caser

  def initialize(opts)
    @orderer = opts[:orderer]
    @caser   = opts[:caser]
  end

  def transform(string)
    caser.case( orderer.order(string) )
  end
end

class Reverser
  def order(string)
    string.reverse
  end
end

class Caser
  attr_accessor :type

  def case(string)
    send(@type, string)
  end

  def down(string)
    string.downcase
  end

  def up(string)
    string.upcase
  end
end

describe Transformer do
  let(:rever){Reverser.new}
  let(:caser){Caser.new}
  let(:trans){Transformer.new({orderer: rever, caser: caser})}

  it "returns a string reversed and upcased" do
    caser.type = "up"
    trans.transform("testing").should == "GNITSET"
  end

  it "returns a string reversed and downcased" do
    caser.type = "down"
    trans.transform("TESTING").should == "gnitset"
  end
end

describe Reverser do
  it "returns a string reversed" do
    rev = Reverser.new
    rev.order("test").should == "tset"
  end
end

describe Caser do
  let(:caser){Caser.new}

  it "returns a string upcased" do
    caser.down("TEST").should == "test"
  end

  it "returns a string downcased" do
    caser.up("test").should == "TEST"
  end
end
