require_relative 'item'
require_relative 'music_album'
require_relative 'genre'

class App
  attr_accessor :music_albums, :genres

  def initialize(main_call)
    @main_call = main_call
    @music_albums= []
    @genres = []
  end

  def list_all_music_albums
  end

  def list_all_genres
  end

  def add_music_album
    puts "\nAdding a Music Album"
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Publish Date (yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is it available on spotify (Y/N): '
    on_spotify = gets.chomp.upcase
    music_album = MusicAlbum.new(genre, author, publish_date, on_spotify)
    music_albums << music_album
    puts "\nMusic Album added successfully!"
  end
end
