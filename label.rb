require_relative 'item'

class Label
  attr_reader :title, :color, :items, :id

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
