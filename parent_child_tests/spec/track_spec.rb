require "track"

RSpec.describe Track do
  describe "@matches?" do
    it "returns true if keyword is part of the artist or track" do
      track_1 = Track.new("Idioteque", "Radiohead")
      track_2 = Track.new("Barbie Girl", "Aqua")
      expect(track_1.matches?("Radio")).to eq true
      expect(track_2.matches?("Radio")).to eq false
      expect(track_1.matches?("Id")).to eq true
    end
  end
end
