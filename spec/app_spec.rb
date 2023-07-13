require 'rspec'
require_relative '../app/app'

RSpec.describe App do
  let(:app) { App.new }

  describe '#list_all_books' do
    context 'when no books are available' do
      it 'displays "No books available."' do
        expect { app.list_all_books }.to output("No books available.\n").to_stdout
      end
    end

    context 'when books are available' do
      it 'displays the list of books' do
        book = Book.new(title: 'Book 1', author: 'Author 1', genre: 'Genre 1', label: 'Label 1',
                        publish_date: '2023-01-01', publisher: 'Publisher 1', cover_state: 'New')
        app.books << book

        expected_output = <<~OUTPUT
          All Books:
          1. Title: Book 1, Author: Author 1
          Genre: Genre 1, Label: Label 1
          Publish Date: 2023-01-01, Publisher: Publisher 1, Cover State: New
        OUTPUT

        expect { app.list_all_books }.to output(expected_output).to_stdout
      end
    end
  end
end
