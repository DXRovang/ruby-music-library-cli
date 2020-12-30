require "pry"

class MusicLibraryController

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
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
      Artist.all.sort! do |a,b|
        a.name <=> b.name
      end
      Artist.all.each_with_index do |artist, index|
        puts "#{index + 1}. " + artist.name
      end    
    end

    def list_genres
      Genre.all.sort! do |a,b|
        a.name <=> b.name
      end
      Genre.all.each_with_index do |genre, index|
        puts "#{index + 1}. " + genre.name
      end    
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      user_input = gets.chomp
      #if the user_input exists in the Artist class:  LOOK @ artist
      if artist = Artist.find_by_name(user_input)
        #note that you can daisy chain loop methods
        artist.songs.sort! {|a,b| a.name <=> b.name }.each_with_index do |song, index|
          puts "#{index + 1}. " + song.name + " - " + song.genre.name
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      user_input = gets.chomp
      if genre = Genre.find_by_name(user_input)
        genre.songs.sort! {|a,b| a.name <=> b.name }.each_with_index do |song, index|
          puts "#{index + 1}. " + song.artist.name + " - " + song.name
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.chomp
      index = input.to_i
      # if index > 0 && index <= Song.all.length
      #    new_index = index - 1
      #    song = list_songs.find { |song| song[new_index] }
      #   end
      #   puts "Playing #{song.name} by #{song.artist.name}"
    end
    
end