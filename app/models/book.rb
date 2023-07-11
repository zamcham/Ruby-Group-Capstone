require-relative 'Item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, genre, author, source, label, publish_date, archived, publisher, cover_state)
    super(id, genre, author, source, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    # Implement the logic for determining if the book can be archived
    # Return true or false based on the conditions
  end
end
