require "gratitudes"

RSpec.describe Gratitudes do
  context "initially" do
    it "returns formatted text with no gratitudes" do
      gratitudes = Gratitudes.new
      expect(gratitudes.format).to eq "Be grateful for: "
    end
  end

  context "one gratitude added" do
    it "returns formatted text with single gratitude" do
      gratitudes = Gratitudes.new
      gratitudes.add("life")
      expect(gratitudes.format).to eq "Be grateful for: life"
    end
  end

  context "multiple gratitudes added" do
    it "returns formatted text with gratitudes listed" do
      gratitudes = Gratitudes.new
      gratitudes.add("life")
      gratitudes.add("food")
      gratitudes.add("everything")
      expect(gratitudes.format).to eq "Be grateful for: life, food, everything"
    end
  end

  
end