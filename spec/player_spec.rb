require 'player'

describe Player do
  subject(:jason) { described_class.new('Jason') }
  subject(:kerri) { described_class.new('Kerri') }

  context '#name' do
    it 'should return a name' do
      expect(jason.name).to eq 'Jason'
    end 
  end 

  context '#hit_points' do
    it 'returns the HP' do
      expect(jason.hit_points).to eq Player::BASE_HP 
    end 
  end 

  describe '#receive_damage' do
    it 'reduces the player HP by 10' do
      expect { jason.receive_damage(10) }.to change { jason.hit_points }.by(-10)
    end 

    it 'can take different amounts of damage' do
      is_expected.to respond_to(:receive_damage).with(1).argument
    end
  end 
end 