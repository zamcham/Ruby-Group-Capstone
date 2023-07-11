require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(id, name)
    @id = id || Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end

