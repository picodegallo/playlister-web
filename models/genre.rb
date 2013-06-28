class Genre

  attr_accessor :name, :songs, :artists

  Genres = []

  def initialize
     Genres << self 
     @songs = []
     @artists = []
  end

  def self.all
    Genres
  end

  def self.reset_genres
    Genres.clear
  end

  def self.find_by_name(name)
    Genres.each do |genre|
      if genre.name == name
        return genre
      end
    end
    return false
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.new.tap{|g| g.name = name}
  end

end
