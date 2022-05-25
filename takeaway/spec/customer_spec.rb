require "customer"

RSpec.describe Customer do
  it "constructs" do
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    expect(customer.name).to eq "Sophie"
    expect(customer.address).to eq "Waterbeach"
    expect(customer.mobile_number).to eq "+447557942369"
  end
end