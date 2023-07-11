require_relative 'item'

# Represents a Music Album Item.
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, publish_date, on_spotify)
    super(genre, author, publish_date, nil)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
end

# music_album = MusicAlbum.new('Rock', 'Author', '2014-01-01', true)

# if music_album.can_be_archived?
#   puts 'This music album can be archived.'
# else
#   puts 'This music album can not be archived.'
# end