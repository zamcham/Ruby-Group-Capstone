require 'date'
require_relative 'label'

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
  end

  def find_or_create_label(label_title)
    existing_label = Label.labels.find { |label| label.title == label_title }
    return existing_label unless existing_label.nil?

    new_label = Label.new(label_title)
    Label.labels << new_label
    new_label
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > (10 * 365)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
