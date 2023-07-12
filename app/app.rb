# rubocop:disable
require_relative 'models/author'
require_relative 'models/book'
require_relative 'models/game'
require 'date'

class App
  attr_accessor :people, :books, :rentals, :games, :authors

  def initialize
    @people = []
    @books = []
    @rentals = []
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
      @music_albums.each do |music_album|
        album_info = "ID: #{music_album.id}, Genre: #{music_album.genre}, " \
                     "Author: #{music_album.author}, Publish date: #{music_album.publish_date}"
        puts album_info
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
      puts 'All Genres:'
      @genres.each do |genre|
        puts "ID: #{genre.id}, Genre: #{genre.name}"
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

  def get_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end
end
# rubocop:enable
