require "./track.rb"

class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track
  end

  def all
    @tracks
  end

  def search(keyword)
    @tracks.select { |track| track if track.matches?(keyword) }
  end
end

track1 = Track.new("hello", "123")
puts track1.matches?("hello")
