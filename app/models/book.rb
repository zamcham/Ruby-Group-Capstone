require_relative 'item'
require 'date'

# Class than handles book creation
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :title, :author, :genre, :label, :publish_date

  def initialize(book_data)
    super(
      book_data[:genre],
      book_data[:author],
      book_data[:publish_date],
      book_data[:label]
    )
    @title = book_data[:title]
    @publisher = book_data[:publisher]
    @cover_state = book_data[:cover_state]
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
