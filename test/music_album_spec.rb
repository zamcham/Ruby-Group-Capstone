require_relative '../app/models/music_album'

RSpec.describe MusicAlbum do
  let(:music_album_data) do
    {
      title: 'New',
      author: 'Name',
      genre: 'Genre',
      label: 'Color',
      publish_date: Date.today,
      on_spotify: 'y'
    }
  end

  let(:music_album) { MusicAlbum.new(music_album_data) }

  describe '#can_be_archived?' do
    it 'returns false if published_date is less than 10 years and if on_spotify equals true.' do
      expect(music_album.can_be_archived?).to be false
    end

    it 'returns true if published_date is older than 10 years and if on_spotify equals true.' do
      music_album_data[:publish_date] = Date.today - 11 * 365
      expect(music_album.can_be_archived?).to be true
    end

    it 'returns false if published_date is older than 10 years and if on_spotify equals false.' do
      music_album_data[:publish_date] = Date.today - 11 * 365
      music_album_data[:on_spotify] = 'n'
      expect(music_album.can_be_archived?).to be false
    end
  end
end
