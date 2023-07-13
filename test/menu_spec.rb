require_relative '../app/menu/menu'

RSpec.describe Menu do
  let(:app) { double('App') }
  let(:menu) { Menu.new(app) }

  describe '#process_choice' do
    context 'when a valid choice is selected' do
      before do
        allow(app).to receive(:list_all_books)
      end

      it 'calls the corresponding method on the app' do
        expect(app).to receive(:list_all_books)
        menu.process_choice(1)
      end

      it 'returns true' do
        expect(menu.process_choice(1)).to be true
      end
    end

    context 'when an invalid choice is selected' do
      it 'prints an error message' do
        expect { menu.process_choice(99) }.to output("Invalid choice. Please try again.\n").to_stdout
      end
    end
  end
end
