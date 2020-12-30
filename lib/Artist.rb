require "pry"
require "./lib/concerns/findable.rb"

class Artist
  extend Concerns::Findable

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
    self.class.all << self
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
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end

  def genres
    genre_return = songs.collect do |song|
      song.genre
    end.uniq
    genre_return
  end

end


