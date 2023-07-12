# frozen_string_literal: true

require_relative 'item'
require 'date'

# Represents a Music Album Item.
class MusicAlbum < Item
  attr_accessor :on_spotify, :id, :publish_date

  def initialize(genre, author, publish_date, on_spotify, id: nil)
    super(genre, author, publish_date, nil)
    @id = id || Random.rand(1...1000)
    @on_spotify = on_spotify
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    super && on_spotify
  end
end
