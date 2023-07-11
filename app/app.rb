require_relative 'models/music_album'
require_relative 'models/item'
require_relative 'models/genre'

# The App class handles the app logic
class App
  attr_accessor :books, :music_albums, :genres

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    # TODO: ↓ Add when working on data management
    # @data_manager = DataManager.new(self)
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'All Books:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
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

  def list_all_genres
    if @genres.empty?
      puts 'Any genre available.'
    else
      puts 'All Genres:'
      @genres.each do |genre|
        puts "ID: #{genre.id}, Genre: #{genre.name}"
      end
    end
  end

  def add_a_music_album
    puts "\nAdd a new Music Album"
    print 'Enter the Music Album\'s genre: '
    genre = gets.chomp
    print 'Enter the Music Album\'s author: '
    author = gets.chomp
    print 'Enter the Music Album\'s publish date(yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is it available on Spotify (Y/N): '
    on_spotify = gets.chomp.upcase
    music_album = MusicAlbum.new(genre, author, publish_date, on_spotify)
    @music_albums << music_album
    puts 'Music Album added successfully!'
  end

  def create_book
    print 'Enter the book\'s title: '
    title = gets.chomp
    print 'Enter the book\'s author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def select_person
    puts 'Select a person to create a rental:'
    list_all_people
    print 'Enter the person\'s ID: '
    person_id = gets.chomp.to_i
    @people.find { |p| p.id == person_id }
  end

  def quit
    @data_manager.save_data_to_files
    false
  end

  def load_data_from_files
    @data_manager.load_data_from_files
  end
end

# genre = Genre.new(1, 'Rock')
# item = Item.new('Rock', 'Author', '2022-01-01', 'Label')
# genre.add_item(item)

# puts 'Genre Items:'
# genre.items.each do |item|
#   puts "Genre: #{item.genre}, Author: #{item.author}"
# end