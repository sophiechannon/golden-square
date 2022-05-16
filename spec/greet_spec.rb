require "greet"

RSpec.describe "greet method" do
  it "prints hello follwed by name given as perameter" do
    result = greet("Sophie")
    expect(result). to eq "Hello, Sophie!"
  end

  it "prints hello follwed by any string given as perameter" do
    result = greet("123456789")
    expect(result). to eq "Hello, 123456789!"
  end
end

