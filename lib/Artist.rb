require "pry"

class Artist

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
      self.songs << song
    end
  end

  #look at this later
  def genres
    collection = []
    self.songs.collect do |song|
      collection << song.genre
    end
    collection.uniq
  end

end
