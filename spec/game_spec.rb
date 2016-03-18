RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

require 'game'

describe Game do
  let(:player1){double :Player, name: "Me", reset_hp: nil}
  let(:player2){double :Player, name: "You", reset_hp: nil}
  let(:player_class) { double :player_class, new: player1}
  let(:game_class) { described_class }
  subject(:game){ described_class.new(player: player1) }
  let(:player){ double :Player }
  let(:damage){Player::DAMAGE}

  context 'class methods' do
    describe '#self.create' do
      it 'creates player objects' do
        expect(player_class).to receive :new
        game_class.create(player_name: player1.name, player_class: player_class)
      end
    end
  end

  context 'instance methods' do

    before :each do
      game_class.create(player_name: player1.name, player_class: player_class)
    end

    describe "#initialize" do
      it ' adds player 1 to first position in players'  do
        game_class.create(player_name: player1.name, player_class: player_class)
        expect(game.players.first).to eq player1
      end
      # it { expect(game.now_playing).to eq player1 }
      # it { expect(game.opponent).to eq player2 }
    end

    describe '#add_player' do
      it 'increases the length of the players array by 1' do
        game_class.create(player_name: player1.name, player_class: player_class)
        expect{ game_class.current_game.add_player(player2.name) }.to change{ game_class.current_game.players.length}.by(1)
      end

      it 'finds player 2 in last position in players' do
        game_class.create(player_name: player1.name, player_class: player_class)
        allow(player_class).to receive(:new) { player2}
        game_class.current_game.add_player(player2.name)
        expect(game_class.current_game.players.last.name).to eq player2.name
      end
    end

    describe '#restart',:broken => true do
      # it { expect(game.now_playing).to eq player1 }
      # it { expect(game.opponent).to eq player2 }
      it 'resets player1 hp' do
        expect(player1).to receive :reset_hp
        game.restart
      end
      it 'resets player2 hp' do
        expect(player2).to receive :reset_hp
        game.restart
      end
    end

    describe "#attack" do
      it "tells a player to sustain damage" do
        expect(player2).to receive(:sustain_damage)
        game.attack(player2)
      end
    end

    # describe "#switch" do
    #   it "toggles between player turns" do
    #     game.switch
    #     expect(game.now_playing).to eq player2
    #   end
    #   it "toggles repeatedly between player turns" do
    #     game.switch
    #     game.switch
    #     expect(game.now_playing).to eq player1
    #   end
    # end

    context 'opponent' do

      before :each do
        game_class.create(player_name: player1.name, player_class: player_class)
        allow(player_class).to receive(:new) { player2}
        game_class.current_game.add_player(player2.name)
      end

      describe '#find_opponent' do
        it { expect(game_class.current_game.find_opponent_of(player1.name)).to eq player2 }
        it { expect(game_class.current_game.find_opponent_of(player2.name)).to eq player1 }
      end
    end
  end
end
