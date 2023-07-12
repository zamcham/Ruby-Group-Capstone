require_relative 'item'

# Represents Genre class.
class Genre
  attr_reader :id, :name, :items

  def initialize(id, name)
    @id = id || Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def to_s
    name.to_s
  end
end
