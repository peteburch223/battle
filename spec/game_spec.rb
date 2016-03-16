require 'game'

describe Game do

  subject(:game){ described_class.new }
  let(:player){ double :Player}
  let(:damage){Player::DAMAGE}

  describe "#attack" do
    it "tells a player to sustain damage" do
      expect(player).to receive(:sustain_damage)
      game.attack(player)
    end
  end

end
