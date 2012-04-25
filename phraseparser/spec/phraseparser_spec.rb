describe PhraseParser do

  let(:chars){ 13 }
  let(:phrase){ "Four score and seven years ago our fathers brought forth upon this continent a new nation, conceived in liberty and dedicated to the proposition that all men are created equal..."}
  let(:parser){ PhraseParser.new(chars, phrase) }

  context "when we want each line to maximum length" do
    it "has no line with too many characters" do
      parser.parse.collect{ |line|
        line.length.should be <= chars 
      }
    end

   context "when the full phrased is parsed" do
      let(:expected_lines){
         ["Four score","and seven","years ago our",
          "fathers","brought forth","upon this","continent a",
          "new nation,","conceived in","liberty and","dedicated to",
          "the","proposition","that all men",
          "are created","equal..."]
      }

      it "has the correct number of lines" do
        parser.parse.count.should == expected_lines.count 
      end

      it "has the correct text on each line" do
        lines = parser.parse
        lines.each_index{|i| lines[i].should == expected_lines[i]}
      end
    end
  end


end
