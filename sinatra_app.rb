require 'sinatra/base'
require './models/artist.rb'
require './models/genre.rb'
require './models/song.rb'
require './models/parse.rb'
require './models/youtube.rb'
require 'youtube_search'

module Playlister
  
  class SinatraApp < Sinatra::Base 

    Parse.new.parse

    get '/' do 
      erb :'index'
    end

    get '/artists' do
      @artist = Artist.all 

      erb :'artistindex'
    end

    get '/artists/:name' do 
      @artists = Artist.find_by_name(params[:name])

      erb :'artists'
    end

    get '/songs' do
      @song = Song.all

      erb :'songindex'
    end

    get '/songs/:name' do 
      @song = Song.find_by_name(params[:name])
      @id = Song.videoid(params[:name])

      erb :'songs'
    end

    get '/genres' do 
      @genre = Genre.all

      erb :'genreindex'
    end

    get '/genres/:genre' do 
      @genre = Genre.find_by_name(params[:genre])

      erb :'genres'
    end

  end

end