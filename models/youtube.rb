require 'youtube_search'

class Youtube

  attr_accessor :song, :id

  def initialize
    @song = song
  end

  def self.videoid
  @id = YoutubeSearch.search("#{@song}", 'orderby' => 'viewCount').first['video_id']
  end

end
