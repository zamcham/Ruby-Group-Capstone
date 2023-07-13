require_relative 'item'
require 'date'

# Represents a Music Album Item.
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :title, :id, :genre, :label

  def initialize(music_album_data)
    super(
      music_album_data[:genre],
      music_album_data[:author],
      music_album_data[:publish_date],
      music_album_data[:label]
    )
    @title = music_album_data[:title]
    @on_spotify = music_album_data[:on_spotify].to_s.downcase == 'y'
  end

  def can_be_archived?
    super && on_spotify
  end
end
