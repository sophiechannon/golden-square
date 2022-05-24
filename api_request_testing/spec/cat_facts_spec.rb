require "cat_facts"

RSpec.describe CatFacts do
  it "gets a cat fact and returns it as a string" do
    requester = double :requester
    cat_facts = CatFacts.new(requester)
    expect(requester).to receive(:get)
    .with(URI("https://catfact.ninja/fact"))
    .and_return('{"fact":"When a domestic cat goes after mice, about 1 pounce in 3 results in a catch.","length":76}')
    expect(cat_facts.provide).to eq "Cat fact: When a domestic cat goes after mice, about 1 pounce in 3 results in a catch."
  end
end
