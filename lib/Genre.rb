class Genre

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
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  #look at this later
  def artists
    collection = []
    self.songs.collect do |song|
      collection << song.genre
    end
    collection.uniq
  end




end