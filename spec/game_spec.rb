require 'game'

describe Game do

  let(:player1_name){"Me"}
  let(:player2_name){"You"}


  let(:player1){double :Player, name: "Me"}
  let(:player2){double :Player, name: "You"}
  subject(:game){ described_class.new(player1: player1, player2:player2) }
  let(:player){ double :Player}
  let(:damage){Player::DAMAGE}

  describe "#initialize" do
    it { expect(game.player1).to eq player1 }
    it { expect(game.player2).to eq player2 }
    it { expect(game.now_playing).to eq player1 }
    it { expect(game.opponent).to eq player2 }
  end

  describe "#attack" do
    it "tells a player to sustain damage" do
      expect(player2).to receive(:sustain_damage)
      game.attack(player2)
    end
  end

  describe "#switch" do
    it "toggles between player turns" do
      game.switch
      expect(game.now_playing).to eq player2
    end
    it "toggles repeatedly between player turns" do
      game.switch
      game.switch
      expect(game.now_playing).to eq player1
    end
  end
end
