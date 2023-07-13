require 'date'
require_relative '../app/models/item'
require_relative '../app/models/label'
require_relative '../app/models/author'
require_relative '../app/models/genre'

RSpec.describe Item do
  let(:genre) { Genre.new(1, 'Horror') }
  let(:author) { Author.new(1, 'John', 'Doe') }
  let(:label) { Label.new('New') }
  let(:publish_date) { Date.new(2022, 1, 1) }

  describe '#initialize' do
    context 'when label is provided' do
      it 'finds or creates the label and adds the item to it' do
        expect(Label).to receive(:labels).and_return([label])
        expect(label).to receive(:add_item).with(kind_of(Item))

        Item.new(genre, author, publish_date, 'New')
      end
    end

    context 'when author is provided' do
      it 'finds or creates the author and adds the item to it' do
        expect(Author).to receive(:authors).and_return([author])
        expect(author).to receive(:add_item).with(kind_of(Item))

        Item.new(genre, 1, publish_date, label)
      end
    end

    context 'when genre is provided' do
      it 'finds or creates the genre and adds the item to it' do
        expect(Genre).to receive(:genres).and_return([genre])
        expect(genre).to receive(:add_item).with(kind_of(Item))

        Item.new('Horror', author, publish_date, label)
      end
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the item can be archived' do
      item = Item.new(genre, author, Date.today - (11 * 365), label)
      expect(item.can_be_archived?).to be true
    end

    it 'returns false if the item cannot be archived' do
      item = Item.new(genre, author, Date.today - (9 * 365), label)
      expect(item.can_be_archived?).to be false
    end
  end

  describe '#move_to_archive' do
    it 'sets the archived flag based on can_be_archived?' do
      item = Item.new(genre, author, Date.today - (11 * 365), label)
      item.move_to_archive
      expect(item.archived).to be true

      item = Item.new(genre, author, Date.today - (9 * 365), label)
      item.move_to_archive
      expect(item.archived).to be false
    end
  end
end
