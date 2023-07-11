require_relative 'item'

class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    raise TypeError, 'Invalid type, must be an Item instance' unless item.is_a?(Item)
    
    @items << item
    item.author = self
  end
end
