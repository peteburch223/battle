require 'game'

describe Game do
  let(:player1){double :Player, name: "Me", reset_hp: nil}
  let(:player2){double :Player, name: "You", reset_hp: nil}
  let(:player_class) { double :player_class, new: player}
  let(:game_class) { described_class }
  subject(:game){ described_class.new(player1: player1, player2:player2) }
  let(:player){ double :Player }
  let(:damage){Player::DAMAGE}

  describe '#self.create' do
    it 'creates player objects' do
      expect(player_class).to receive :new
      game_class.create(player1_name: player1.name, player2_name: player2.name, player_class: player_class)
    end
  end

  describe '#restart' do
    it { expect(game.now_playing).to eq player1 }
    it { expect(game.opponent).to eq player2 }
    it 'resets player1 hp' do
      expect(player1).to receive :reset_hp
      game.restart
    end
    it 'resets player2 hp' do
      expect(player2).to receive :reset_hp
      game.restart
    end
  end

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

  describe '#find_opponent' do
    it { expect(game.find_opponent_of(player1.name)).to eq player2 }
    it { expect(game.find_opponent_of(player2.name)).to eq player1 }
  end
end
