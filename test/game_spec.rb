require_relative '../app/models/game'

RSpec.describe Game do
  let(:game_data) do
    {
      game_name: 'Game',
      genre: 'Genre',
      author: 'Author',
      publish_date: Date.today,
      label: 'Label',
      multiplayer: true,
      last_played_at: (Date.today - 731).to_s
    }
  end

  let(:game) { Game.new(game_data) }

  describe '#initialize' do
    it 'assigns game_name, multiplayer, and last_played_at' do
      expect(game.game_name).to eq('Game')
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to eq((Date.today - 731).to_s)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the parent method returns true' do
      allow(game).to receive(:super).and_return(true)
      expect(game.can_be_archived?).to be true
    end

    it 'returns true if last_played_at is nil' do
      game.last_played_at = nil
      expect(game.can_be_archived?).to be true
    end

    it 'returns true if the difference between last_played_at and today is greater than 730 days' do
      game.last_played_at = (Date.today - 731).to_s
      expect(game.can_be_archived?).to be true
    end

    it 'returns false if the difference between last_played_at and today is less than or equal to 730 days' do
      game.last_played_at = (Date.today - 730).to_s
      expect(game.can_be_archived?).to be false
    end
  end
end
