require "pry"

class MusicLibraryController

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call

      #if user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
      
      until user_input == "exit"
        user_input = gets.chomp
      end  
    end

    def list_songs
      Song.all.sort! do |a,b|
        a.name <=> b.name
      end
      Song.all.each_with_index do |song, index|
        puts "#{index + 1}. " + song.artist.name + " - " + song.name + " - " + song.genre.name
        #binding.pry
      end
    end
  
    def list_artists
      Song.all.uniq do |song|
        song.artist.name
        binding.pry
      end


    #   Song.all.sort! do |a,b|
    #     a.artist.name <=> b.artist.name
    #   end
    #   Song.all.each_with_index do |song, index|
    #     puts "#{index + 1}. " + song.artist.name
    #   end    
    # end
    
end