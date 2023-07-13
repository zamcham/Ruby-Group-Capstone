require 'date'
require_relative 'label'
require_relative 'author'
require_relative 'genre'

# Represents Item class (parent).
class Item
  attr_accessor :archived, :genre, :author, :label

  def initialize(genre, author, publish_date, label, id: nil)
    @id = id || Random.rand(1...1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
    find_or_create_label(label).add_item(self) unless label.nil?
    find_or_create_author(author).add_item(self) unless author.nil?
    find_or_create_genre(genre).add_item(self) unless genre.nil?
  end

  def find_or_create_label(label_title)
    existing_label = Label.labels.find { |label| label.title == label_title }
    return existing_label unless existing_label.nil?

    new_label = Label.new(label_title)
    Label.labels << new_label
    new_label
  end

  def find_or_create_author(id)
    existing_author = Author.authors.find { |author| author.id == id }
    return existing_author unless existing_author.nil?

    new_author = Author.new(id, author, nil)
    Author.authors << new_author
    new_author
  end

  def find_or_create_genre(genre_name)
    existing_genre = Genre.genres.find { |genre| genre.name == genre_name }
    return existing_genre unless existing_genre.nil?

    new_genre = Genre.new(Random.rand(1..10_000), genre_name)
    Genre.genres << new_genre
    new_genre
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > (10 * 365)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
