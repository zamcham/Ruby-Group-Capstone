require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, genre, author, publish_date, on_spotify)
  end

  def can_be_archived?
  end
end
