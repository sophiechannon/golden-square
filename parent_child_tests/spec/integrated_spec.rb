require "music_library"
require "track"

RSpec.describe MusicLibrary do
  it "adds and returns track objects" do
    music_library = MusicLibrary.new
    track_1 = Track.new("Idioteque", "Radiohead")
    music_library.add(track_1)
    expect(music_library.all).to eq [track_1]
  end

  it "takes a keyword entered in the MusicLibrary class and checks it matches that instancce" do
    music_library = MusicLibrary.new
    track_1 = Track.new("Idioteque", "Radiohead")
    track_2 = Track.new("Song 2", "Blur")
    track_3 = Track.new("Song 3", "Radiohead")
    music_library.add(track_1)
    music_library.add(track_2)
    music_library.add(track_3)
    expect(music_library.search("Idi")).to eq [track_1]
  end
end
