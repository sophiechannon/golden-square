require "menu"

RSpec.describe Menu do
  context "initially" do
    it "is empty" do
      terminal = double :terminal
      menu = Menu.new(terminal)
      expect(menu.all).to eq []
    end
  end
end