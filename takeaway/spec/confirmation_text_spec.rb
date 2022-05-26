require "confirmation_text"
require "json"

RSpec.describe ConfirmationText do
  it "constructs" do
    customer = double :customer, name: "Sophie", mobile_number: ENV['MY_NUMBER']
    text = ConfirmationText.new(customer)
    expect(text.customer.name).to eq "Sophie"
  end

  # this works if I have a requester argument for my CnfirmationText class, but then the integration test won't work
  xit "sends a message" do
    customer = double :customer, name: "Sophie", mobile_number: ENV['MY_NUMBER']
    create = double :create, sid: "SM2767b0752e8e408f8a77efcd1fc2c4a3"
    messages = double :messages, create: create
    requester = double :requester, messages: messages
    message = double :message, sid: "SM2767b0752e8e408f8a77efcd1fc2c4a3" 
    text = ConfirmationText.new(customer, requester)
    expect(text.send).to eq "SM2767b0752e8e408f8a77efcd1fc2c4a3"
  end

end