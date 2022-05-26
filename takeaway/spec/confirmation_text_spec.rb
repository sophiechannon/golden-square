require "confirmation_text"
require "json"

RSpec.describe ConfirmationText do
  xit "constructs" do
    customer = double :customer, name: "Sophie", mobile_number: "+447557942369"
    requester = double :requester
    terminal = double :terminal
    text = ConfirmationText.new(customer, requester, terminal)
    expect(text.customer.name).to eq "Sophie"
  end

  xit "sends a message" do
    customer = double :customer, name: "Sophie", mobile_number: "+447557942369"
    requester = double :requester
    terminal = double :terminal
    text = ConfirmationText.new(customer, requester, terminal)
    expect(text.requester).to receive(:gets).with("https://api.twilio.com/2010-04-01/Accounts/ACee81d43509a2a51b841d04f24296df35/Messages.json")
    .and_return('{"sid": "SM2767b0752e8e408f8a77efcd1fc2c4a3", "date_created": "Thu, 26 May 2022 11:34:19 +0000", "date_updated": "Thu, 26 May 2022 11:34:19 +0000", "date_sent": null, "account_sid": "ACee81d43509a2a51b841d04f24296df35", "to": "+447557942369", "from": null, "messaging_service_sid": "MGc693f037b4cd513443a7e1e7c04e34da", "body": "testing123", "status": "accepted", "num_segments": "0", "num_media": "0", "direction": "outbound-api", "api_version": "2010-04-01", "price": null, "price_unit": null, "error_code": null, "error_message": null, "uri": "/2010-04-01/Accounts/ACee81d43509a2a51b841d04f24296df35/Messages/SM2767b0752e8e408f8a77efcd1fc2c4a3.json", "subresource_uris": {"media": "/2010-04-01/Accounts/ACee81d43509a2a51b841d04f24296df35/Messages/SM2767b0752e8e408f8a77efcd1fc2c4a3/Media.json"}}')
    expect(terminal).to receive(:puts).with("SM2767b0752e8e408f8a77efcd1fc2c4a3")
    text.send
  end
end