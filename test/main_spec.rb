require 'rspec'
require_relative '../main'

describe Main do

  let(:app) { double('App') }
  let(:menu) { double('Menu') }

  before do
    allow(App).to receive(:new).and_return(app)
    allow(Menu).to receive(:new).and_return(menu)

    # Stub any methods called in run
    allow(app).to receive(:load_data_from_files)
    allow(menu).to receive(:display)
    allow(menu).to receive(:process_choice)
  end

  describe '#initialize' do
    it 'creates a new App' do
      expect(App).to receive(:new)
      described_class.new
    end

    it 'creates a new Menu' do
      expect(Menu).to receive(:new).with(app)
      described_class.new
    end
  end

    describe '#run' do
    it 'loads data from files' do
      subject.run
    end

    it 'displays the menu' do
      allow(menu).to receive(:display)
      allow(gets).to receive(:chomp).and_return('1')

      expect(menu).to receive(:process_choice).with(0)
      subject.run
    end

    it 'breaks if menu choice processing returns false' do
      allow(menu).to receive(:display)
      allow(gets).to receive(:chomp).and_return('1')
      allow(menu).to receive(:process_choice).and_return(false)

      expect(subject.run).to be_nil
    end
  end
end
