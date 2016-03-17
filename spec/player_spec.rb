require 'player'

describe Player do
  let(:name){ "Player1" }
  let(:opponent_name){ "Opponent" }
  let(:hp){60}
  let(:opponent){described_class.new(name:opponent_name, hp:hp, damage:damage)}
  let(:damage){10}
  subject(:player){ described_class.new(name: name, hp: hp, damage:damage) }

  describe "#name" do
    it 'returns its name' do
      expect(player.name).to eq name
    end
  end

  describe "#hp" do
    it 'returns its hp' do
      expect(player.hp).to eq hp
    end
  end

  describe '#reset_hp' do
    it 'resets the hitpoints' do
      player.reset_hp(hp)
      expect(player.hp).to eq hp
    end
  end

  describe "#sustain_damage" do
    it "reduces its own hp by 'damage'" do
      expect{ player.sustain_damage }.to change{ player.hp }.by -damage
    end
  end
end
