require_relative 'item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id || Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end
end

