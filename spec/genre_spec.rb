require_relative '../app/models/genre'

RSpec.describe Genre do
  let(:genre) { Genre.new(1, 'Horror') }

  describe '#initialize' do
    it 'assigns id and name' do
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Horror')
    end

    it 'initializes an empty items array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#to_s' do
    it 'returns the genre name as a string' do
      expect(genre.to_s).to eq('Horror')
    end
  end
end
