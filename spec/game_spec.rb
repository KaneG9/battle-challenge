require 'game'

describe Game do
  let(:p1) { double :player }
  let(:p2) { double :player }
  let(:player_double) { double :player }
  let(:game) { described_class.new(p1, p2) }

  describe '#initialize' do 
    it 'creates instances of the player class' do
      expect(game.player_one).to eq p1
    end
  end
  
  describe '#attack' do 
    it 'responds to attack' do
      expect(game).to respond_to :attack
    end

    it 'player 2 calls receive_damage' do
      allow(p2).to receive(:receive_damage)
      expect(p2).to receive(:receive_damage) 
      game.attack(p2)
    end
  end
end