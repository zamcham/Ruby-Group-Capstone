# rubocop:disable

require_relative 'models/author'
require_relative 'models/book'
require_relative 'models/game'
require_relative 'models/music_album'
require_relative 'models/item'
require_relative 'models/genre'
require_relative '../data/data_manager'
require_relative 'models/label'
require 'date'

class App
  attr_accessor :books, :music_albums, :genres, :games

  def initialize
    @books = []
    @games = []
    @music_albums = []
    @genres = []
    @data_manager = DataManager.new(self)
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'All Books:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
        puts "Genre: #{book.genre}, Label: #{book.label}"
        puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music album available.'
    else
      puts 'All Music Albums:'
      @music_albums.each_with_index do |music_album, index|
        puts '-------------------'
        puts "#{index + 1}. ID: #{music_album.id},"
        puts "Title: #{music_album.title}, Label: #{music_album.label},"
        puts "Genre: #{music_album.genre}, Author: #{music_album.author},"
        puts "Publish date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
      end
    end
  end

  def list_all_games
    if @games.empty?
      puts 'No games available.'
    else
      puts 'All Games:'
      @games.each do |game|
        puts '========================================'
        puts "Game Name: #{game.game_name}"
        puts "Genre: #{game.genre}"
        puts "Author: #{game.author}"
        puts "Publish Date: #{game.publish_date}"
        puts "Label: #{game.label}"
        puts "Last Played At: #{game.last_played_at}"
        puts "Multiplayer: #{game.multiplayer}"
        puts '========================================'
      end
    end
  end

  def list_all_genres
    if Label.labels.empty?
      puts 'No genre available.'
    else
      puts '-------------------'
      puts 'All Genres:'
      unique_genres = Genre.genres.uniq
      unique_genres.each do |genre|
        puts "ID: #{genre.id}, Genre: #{genre.name}"
      end
    end
  end

  def list_all_labels
    if Label.labels.empty?
      puts 'No labels found'
    else
      puts '-------------------'
      puts 'All Labels:'
      unique_labels = Label.labels.uniq
      unique_labels.each do |label|
        puts "Label Name: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_all_authors
    if Author.authors.empty?
      puts 'No authors found'
    else
      puts '-------------------'
      puts 'All Authors:'
      unique_authors = Author.authors.uniq
      unique_authors.each do |author|
        puts "Author Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def collect_game_data
    {
      game_name: get_input('Enter the game name'),
      genre: get_input('Enter the game genre'),
      author: get_input('Enter the game author'),
      publish_date: get_input('Enter the game\'s publish date in format YYYY-MM-DD'),
      label: get_input('Enter the game label'),
      multiplayer: get_input('Enter whether the game is multiplayer (true/false)'),
      last_played_at: get_input('Enter the last played date in format YYYY-MM-DD')
    }
  end

  def add_a_game
    game_data = collect_game_data
    game = Game.new(game_data)
    @games << game
    puts 'Game created successfully.'
  end

  def add_a_music_album(music_album_data = nil)
    music_album_data ||= collect_music_album_data
    music_album = MusicAlbum.new(music_album_data)
    @music_albums << music_album
    puts 'Music Album added successfully!'
  end

  def add_a_book(book_data = nil)
    book_data ||= collect_book_data
    book = Book.new(book_data)
    @books << book
    puts 'Book created successfully.'
  end

  def quit
    @data_manager.save_data_to_files
    false
  end

  def load_data_from_files
    @data_manager.load_data_from_files
  end

  private

  def collect_book_data
    {
      title: get_input("Enter the book's title"),
      author: get_input("Enter the book's author"),
      genre: get_input("Enter the book's genre"),
      label: get_input("Enter the book's label"),
      publish_date: get_input("Enter the book's publish date in format YYYY-MM-DD"),
      publisher: get_input("Enter the book's publisher"),
      cover_state: get_input("Enter the book's cover state")
    }
  end

  def collect_music_album_data
    {
      title: get_input("Enter the Music Album's title"),
      genre: get_input("Enter the Music Album's genre"),
      author: get_input("Enter the Music Album's author"),
      label: get_input("Enter the Music Album's label"),
      publish_date: get_input("Enter the Music Album's publish date(yyyy-mm-dd)"),
      on_spotify: get_input('Is it available on Spotify (y/n)')
    }
  end

  def get_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end
end
# rubocop:enable
