# frozen_string_literal: true

# Represents Label class.
class Label
  attr_reader :title, :color, :items, :id, :labels

  @labels = []

  class << self
    attr_reader :labels
  end

  def initialize(title, color = 'blue')
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
