require "grammar_stats"

RSpec.describe GrammarStats do
  it "check method throws error if text is empty" do
    grammar_stats = GrammarStats.new
    expect { grammar_stats.check("")}.to raise_error "No text was provided!"
  end
  
  describe "percentage_good method" do
    it "percentage_good method returns correct perccentage" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("hello")
      grammar_stats.check("hello.")
      grammar_stats.check("I'm not valid")
      grammar_stats.check("I'm all good!") # passing text
      expect(grammar_stats.percentage_good).to eq 25
    end

    it "percentage_good method throws error if no checks have been made" do
      grammar_stats = GrammarStats.new
      expect { grammar_stats.percentage_good}.to raise_error "No checks have been made yet!"
    end
  end
end

# I started with more tests but refactored them out as the class gained functionality.