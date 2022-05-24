require "time_error"
require "date"

RSpec.describe TimeError do
  it "returns the difference between the local and remote time" do
    requester = double :requester
    time_error = TimeError.new(requester)
    #Could also use Time.new(2022, 5, 21, 15, 16) instead of DateTime
    time_now = DateTime.parse("2022-05-24 15:43:37.566453000 +0100").to_time
    expect(requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{
      "abbreviation": "BST",
      "client_ip": "78.143.219.6",
      "datetime": "2022-05-24T15:17:09.668721+01:00",
      "day_of_week": 2,
      "day_of_year": 144,
      "dst": true,
      "dst_from": "2022-03-27T01:00:00+00:00",
      "dst_offset": 3600,
      "dst_until": "2022-10-30T01:00:00+00:00",
      "raw_offset": 0,
      "timezone": "Europe/London",
      "unixtime": 1653401829,
      "utc_datetime": "2022-05-24T14:17:09.668721+00:00",
      "utc_offset": "+01:00",
      "week_number": 21
      }')
    expect(time_error.error(time_now)).to eq -1587.897732
  end
end
