CREATE TABLE labels (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Author(
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
)

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  genre_id INT REFERENCES genres(id),
  author_id INT REFERENCES authors(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE music_albums (
  id INT PRIMARY KEY REFERENCES items(id),
  on_spotify BOOLEAN
);

CREATE TABLE books (
  id INT PRIMARY KEY REFERENCES items(id),
  title VARCHAR(255),
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
);

CREATE TABLE Game(
  id INT PRIMARY KEY REFERENCES items(id),
  last_played_at DATE NOT NULL,
  multiplayer NULL
)