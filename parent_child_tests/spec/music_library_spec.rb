require "music_library"

RSpec.describe MusicLibrary do
  context "initially" do
    it "is empty" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
  end

  it "adds and returns track objects" do
    music_library = MusicLibrary.new
    track_1 = double :track
    music_library.add(track_1)
    expect(music_library.all).to eq [track_1]
  end

  it "takes a keyword entered in the MusicLibrary class and checks it matches that instancce" do
    music_library = MusicLibrary.new
    track_1 = double :track, matches?: true
    music_library.add(track_1)
    expect(music_library.search("Radiohead")).to eq [track_1]
  end
end
