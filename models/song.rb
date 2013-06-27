require 'youtube_search'

class Song

  attr_accessor :name, :artist
  attr_reader :genre

  All = []
  
  def initialize
    All << self
    @artist = artist
  end

  def self.all
    All
  end

   def self.reset_songs
    All.clear
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def self.find_by_name(name)
   All.each do |song|
    if song.name == name
      return song
    end
  end
    return false
  end

  def self.videoid(name)
    @id = YoutubeSearch.search("#{name} #{@artist}", 'genre' => 16, 'orderby' => 'relevance').first['video_id']
  end

end 