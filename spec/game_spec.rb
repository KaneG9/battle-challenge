require 'game'

describe Game do
  let(:p1) { double(:player, :receive_damage => true )}
  let(:p2) { double :player, :receive_damage => true }
  let(:player_double) { double :player }
  let(:game) { described_class.new(p1, p2) }

  describe '#initialize' do 
    it 'creates instances of the player class' do
      expect(game.player_one).to eq p1
    end

    it "Player 1's turn to begin" do
      expect(game.turn_player_one).to be true
    end
  end
  
  describe '#attack' do 
    it 'responds to attack' do
      expect(game).to respond_to :attack
    end

    it 'player 2 calls receive_damage' do
      expect(p2).to receive(:receive_damage) 
      game.attack
    end

    it "After attack it is no longer p1's turn" do
      game.attack
      expect(game.turn_player_one).to be false
    end

    it "second attack player 1 receives damage" do
      game.attack
      expect(p1).to receive(:receive_damage) 
      game.attack
    end
  end
end