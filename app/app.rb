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
  attr_accessor :books, :music_albums, :genres, :games, :authors

  def initialize
    @books = []
    @games = []
    @authors = []
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

  # TODO: Need to refactor based on proper methods
  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'All People:'
      @people.each do |person|
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Type: #{person.class}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No authors available.'
    else
      puts 'All Authors:'
      @authors.each do |author|
        puts "ID: #{author.id}, Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music album available.'
    else
      puts 'All Music Albums:'
      @music_albums.each_with_index do |music_album, index|
        puts "#{index + 1}. ID: #{music_album.id}" 
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
        puts "Game Name: #{game.game_name}, Last Played At: #{game.last_played_at}, Multiplayer: #{game.multiplayer}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No genre available.'
    else
      puts '-------------------'
      puts 'All Genres:'
      @genres.each do |genre|
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

  def add_a_game
    print 'Enter the game name: '
    game_name = gets.chomp
    print 'Enter whether the game is multiplayer (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter the game\'s publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Enter the last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp
    game = Game.new(game_name, multiplayer, publish_date, last_played_at)
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
      on_spotify: get_input("Is it available on Spotify (Y/N)")
    }
  end

  def get_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end
end
# rubocop:enable
