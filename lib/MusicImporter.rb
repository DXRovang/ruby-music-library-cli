require "pry"

class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
    @@all << self
  end

  #looks for an array 
  def files
    Dir.children(@path)
    #binding.pry
  end

  # def self.import 
  #   import_file = self.files
  #   import_file.each do |file|
  #     Song.new_from_filename(file)
  #   end
  # end

  

end

# def import 
#   import_file = self.files
#   import_file.each do |file|
#     Song.new_from_filename(file)
#   end
# end
#FROM:   ruby-oo-object-relationships-collaborating-objects-lab