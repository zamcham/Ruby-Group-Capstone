require 'date'

class Item
  attr_accessor :archived

  def initialize(genre, author, publish_date, id: nil)
      @id = id || Random.rand(1...1000)
      @genre = genre
      @author = author
      @source = source
      @label = label
      @publish_date = Date.parse(publish_date)
      @archived = false
  end

    def can_be_archived?
    (Date.today - @publish_date).to_i > ( 10 * 365)
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    else
      @archived = false
    end
  end
end
