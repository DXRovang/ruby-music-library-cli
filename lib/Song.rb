require "pry"
require "./lib/concerns/findable.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre, :artist
  
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) #if artist.class == Artist
    self.genre=(genre) #if genre.class == Genre
    #binding.pry
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
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  #custom setter method
  def artist=(artist)
    if artist != nil 
      #adds artist instance var 
      @artist = artist
      #adds self to Artist class
      artist.add_song(self)
    else
      @artist = artist
    end
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      value = genre.songs.include?(self)
      if value == false
        genre.songs << self
      end
    else
      @genre = nil
    end
  end

  def self.find_by_name(name)
    #iterate through Song
    Song.all.find do |song| 
      #return song instance with that name
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    #if find_by_name method is true, return it
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      #else create a new Song instance
      Song.create(name)
    end
  end


  def self.new_from_filename(filename)

    #separate the filename
     artist_name = filename.split(" - ")[0]
     name = filename.split(" - ")[1]
     genre_name = filename.split(" - ")[2].split(".")[0]

      artist1 = Artist.find_or_create_by_name(artist_name)
      genre2 = Genre.find_or_create_by_name(genre_name)

    #create a new instance
     song = Song.new(name, artist1, genre2)  
    # #associate instance with artist
     song.artist = artist1
     song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end

#"Thundercat - For Love I Come - dance.mp3"








    # parts = filename.split(" - ")
    # artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    # artist = Artist.find_or_create_by_name(artist_name)
    # genre = Genre.find_or_create_by_name(genre_name)

    # new(song_name, artist, genre)

    