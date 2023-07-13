require 'rspec'

describe Label do
  describe '#initialize' do
    it 'creates a new label with title and color' do
      label = Label.new('Example Label', 'red')

      expect(label.title).to eq('Example Label')
      expect(label.color).to eq('red')
      expect(label.items).to be_empty
    end

    it 'sets the default color to blue if not provided' do
      label = Label.new('Default Label')

      expect(label.color).to eq('blue')
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Label')
      item = double('Item')

      label.add_item(item)

      expect(label.items).to contain_exactly(item)
    end
  end
end
