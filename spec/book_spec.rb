require_relative '../app/models/book'

RSpec.describe Book do
  let(:book_data) do
    {
      title: 'Title',
      author: 'Author',
      genre: 'Genre',
      label: 'Label',
      publish_date: Date.today,
      publisher: 'Publisher',
      cover_state: 'good'
    }
  end

  let(:book) { Book.new(book_data) }

  describe '#can_be_archived?' do
    it 'returns true if the cover_state is "bad"' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to be true
    end

    it 'returns false if the parent method returns false and cover_state is not "bad"' do
      allow(book).to receive(:super).and_return(false)
      expect(book.can_be_archived?).to be false
    end
  end
end
