require "confirmation_text"
require "json"

RSpec.describe ConfirmationText do
  it "constructs" do
    customer = double :customer
    api = double :api
    client = double :client
    text = ConfirmationText.new(customer, api)
    expect(text.customer).to eq customer
  end

  it "sends a message" do
    customer = double :customer, name: "Sophie", mobile_number: ENV['MY_NUMBER']
    create = double :create, sid: "SM2767b0752e8e408f8a77efcd1fc2c4a3"
    messages = double :messages, create: create
    client = double :client, messages: messages
    api = double :api, client: client
    text = ConfirmationText.new(customer, api)
    expect(text.send).to eq "SM2767b0752e8e408f8a77efcd1fc2c4a3"
  end

end