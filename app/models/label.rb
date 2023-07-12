# Represents Label class.
class Label
  attr_reader :title, :color, :items, :id, :labels
  @@labels = []

  def initialize(title, color = 'blue')
    @title = title
    @color = color
    @items = []
  end

  def self.labels
    @@labels
  end

  def add_item(item)
    @items << item
  end
end
