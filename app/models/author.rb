class Author
  attr_reader :id, :first_name, :last_name, :authors, :items

  @authors = []

  class << self
    attr_reader :authors
  end

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
