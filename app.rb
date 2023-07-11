# frozen_string_literal: true

require_relative 'item'
require_relative 'music_album'
require_relative 'genre'

# Represents the App class where user can interact with the console.
class App
  attr_accessor :music_albums, :genres

  def initialize(main_call)
    @main_call = main_call
    @music_albums = []
    @genres = []
  end

  def list_all_music_albums; end

  def list_all_genres; end

  def add_music_album
    puts "\nAdding a Music Album"
    genre = genre_input
    author = author_input
    publish_date = publish_date_input
    on_spotify = spotify_input
    music_album = MusicAlbum.new(genre, author, publish_date, on_spotify)
    music_albums << music_album
    puts "\nMusic Album added successfully!"
  end

  def genre_input
    print 'Genre: '
    gets.chomp
  end

  def author_input
    print 'Author: '
    gets.chomp
  end

  def publish_date_input
    print 'Publish Date (yyyy-mm-dd): '
    gets.chomp
  end

  def spotify_input
    print 'Is it available on spotify (Y/N): '
    gets.chomp.upcase
  end
end
