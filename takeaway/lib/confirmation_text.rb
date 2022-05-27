require "rubygems"
require "twilio-ruby"
require "date"
require "json"
$LOAD_PATH << File.dirname(__FILE__)
require "api_config.rb"

class ConfirmationText
  def initialize(customer, requester)
    # @account_sid = ENV['TWILIO_ACCOUNT_SID']
    # @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @requester = requester
    @customer = customer
  end

  def requester
    @requester
  end

  def customer
    @customer
  end
  
  def send
    message = requester.messages.create( 
                              body: message_body,
                              messaging_service_sid: 'MGc693f037b4cd513443a7e1e7c04e34da',     
                              to: customer.mobile_number 
    ) 
    message.sid
  end

  private

  def delivery_time
    delivery_time = (Time.now + 3600).strftime("%k:%M") 
  end

  def message_body
    "Thank you #{customer.name}! Your order was placed and will be delivered by #{delivery_time} "
  end
end
