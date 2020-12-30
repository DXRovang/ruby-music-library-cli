require "pry"
require "./lib/concerns/findable.rb"

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artists

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
  
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end


  def artists
    artist_return = songs.collect do |song|
      song.artist
      end.uniq
      artist_return
  end




end