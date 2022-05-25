require "menu"

RSpec.describe Menu do
  context "initially" do
    it "is empty" do
      terminal = double :terminal
      menu = Menu.new(terminal)
      expect(menu.all).to eq []
    end

    it "lets the customer know that the menu is empty" do
      terminal = double :terminal
      menu = Menu.new(terminal)
      expect(terminal).to receive(:puts).with("Restaurant out of stock!")
      menu.view_all
    end
  end
end