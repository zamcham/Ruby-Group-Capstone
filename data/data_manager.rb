require 'json'
require_relative '../app/app'

class DataManager
  def initialize(app)
    @app = app
  end

  def save_data_to_files
    save_to_json('books.json', serialize_books)
    save_to_json('music_albums.json', serialize_music_albums)
  end

  def load_data_from_files
    @app.books = load_from_json('books.json')
    @app.music_albums = load_from_json('music_albums.json')
  end

  def save_to_json(filename, data)
    File.write(filename, JSON.generate(data))
    puts "Data saved to #{filename}."
  end

  def load_from_json(filename)
    return [] unless File.exist?(filename)

    JSON.parse(File.read(filename)).map do |item|
      case item['type']
      when 'MusicAlbum'
        load_music_album(item)
      when 'Teacher'
        load_teacher(item)
      when 'Book'
        load_book(item)
      when 'Rental'
        load_rental(item)
      end
    end
  end

  def load_music_album(item)
    music_album_data = {
      title: item['title'],
      genre: item['genre'],
      author: item['author'],
      label: item['label'],
      publish_date: item['publish_date'],
      on_spotify: item['on_spotify']
    }
    MusicAlbum.new(music_album_data)
  end

  def load_teacher(item)
    Teacher.new(item['age'], item['specialization'], item['name'], id: item['id'].to_i)
  end

  def load_book(item)
    book_data = {
      title: item['title'],
      author: item['author'],
      genre: item['genre'],
      label: item['label'],
      publish_date: item['publish_date'],
      publisher: item['publisher'],
      cover_state: item['cover_state']
    }
    Book.new(book_data)
  end

  def load_rental(item)
    book = @app.books.find { |b| b.title == item['book_title'] }
    person = @app.people.find { |p| p.id == item['person_id'] }
    Rental.new(book, person, item['date'])
  end

  def serialize_people
    @app.people.map do |person|
      serialized_person = {
        'type' => person.class.name,
        'age' => person.age,
        'id' => person.id,
        'name' => person.name
      }
      if person.is_a?(Student)
        serialized_person['parent_permission'] = person.parent_permission
      elsif person.is_a?(Teacher)
        serialized_person['specialization'] = person.specialization
      end
      serialized_person
    end
  end

  def serialize_books
    @app.books.map do |book|
      {
        'type' => book.class.name,
        'title' => book.title,
        'author' => book.author,
        'genre' => book.genre,
        'label' => book.label,
        'publish_date' => book.publish_date,
        'publisher' => book.publisher,
        'cover_state' => book.cover_state
      }
    end
  end

  def serialize_music_albums
    @app.music_albums.map do |music_album|
      {
        'type' => music_album.class.name,
        'id' => music_album.id,
        'title' => music_album.title,
        'author' => music_album.author,
        'genre' => music_album.genre,
        'publish_date' => music_album.publish_date,
        'on_spotify' => music_album.on_spotify,
      }
    end
  end
end
