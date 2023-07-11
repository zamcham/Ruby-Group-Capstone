require_relative 'models/book'

# The App class handles the app logic
class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
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
        puts "Genre: #{book.genre}, Label: #{book.label}"
        puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
      end
    end
  end

  def add_a_book
    book_data = collect_book_data
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
