require "challenge"

RSpec.describe MusicTracker do
  describe "#add_track method" do
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

  describe "#display_list method" do
    it "displays the list of tracks" do
      tracks = MusicTracker.new
      tracks.add_track("You Suffer")
      tracks.add_track("Imagine")
      expect(tracks.display_list).to eq ["You Suffer", "Imagine"]
    end

    it "displays 'Playlist is empty' if no tracks on list" do
      tracks = MusicTracker.new
      expect(tracks.display_list).to eq "Playlist is empty"
    end
  end
end