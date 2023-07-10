require 'date'

class Item
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
      @id = Random.rand(1...1000)
      @genre = genre
      @author = author
      @source = source
      @label = label
      @publish_date = Date.parse(publish_date)
      @archived = false
  end
end
