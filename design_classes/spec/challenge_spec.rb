require "challenge"

RSpec.describe MusicTracker do
  describe "#add_track method" do
    it "returns #list_of_tracks" do
      tracks = MusicTracker.new
      expect(tracks.add_track("Imagine")).to eq ["Imagine"]
    end

    it "fails if string is empty" do
      tracks = MusicTracker.new
      expect { tracks.add_track("") }.to raise_error "Please enter a track"
    end

    it "fails if track is already on the list" do
      tracks = MusicTracker.new
      tracks.add_track("Imagine")
      expect { tracks.add_track("Imagine") }.to raise_error "You must love this song!"
    end
  end


end