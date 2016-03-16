require 'game'

describe Game do
  let(:player1){double :Player}
  let(:player2){double :Player}

  subject(:game){ described_class.new(player1: player1, player2:player2) }
  let(:player){ double :Player}
  let(:damage){Player::DAMAGE}

  describe "#initialize" do
    it {expect(game.player1).to eq player1}
    it {expect(game.player2).to eq player2}  
  end

  describe "#attack" do
    it "tells a player to sustain damage" do
      expect(player).to receive(:sustain_damage)
      game.attack(player)
    end
  end

end
