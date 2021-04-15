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

    it "second attack player 1 receives damage" do
      game.change_turn
      expect(p1).to receive(:receive_damage) 
      game.attack
    end
  end

  describe '#attacker' do
    it 'p1 is initial attacker' do
      expect(game.attacker).to eq game.player_one
    end
    it 'attacker changes after attack' do
      game.change_turn
      expect(game.attacker).to eq game.player_two
    end
  end

  describe '#defender' do
    it 'p2 is initial defender' do
      expect(game.defender).to eq game.player_two
    end
    it 'defender changes after attack' do
      game.change_turn
      expect(game.defender).to eq game.player_one
    end
  end

  describe '#change_turn' do
    it "After change_turn it is no longer p1's turn" do
      game.change_turn
      expect(game.turn_player_one).to be false
    end
  end
end