require "gratitudes"

RSpec.describe Gratitudes do
  # handy to check that join method doesn't throw an error on empty array
  context "initially" do
    it "returns formatted text with no gratitudes" do
      gratitudes = Gratitudes.new
      expect(gratitudes.format).to eq "Be grateful for: "
    end
  end
# handy to check that join method doesn't throw an error on array with one element
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