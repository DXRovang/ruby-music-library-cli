class Song

  attr_accessor :name, :genre, :artist
  

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    @genre = genre
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
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  #custom setter - adds artist & adds self to Artist class
  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    else
      @artist = artist
    end
  end

  #look at this later
  def genre=(genre)
    @genre = genre
  end

  def find_by_name

  end

  def find_or_create_by_name

  end

  def self.new_from_filename

  end

  def self.create_from_filename

  end
end