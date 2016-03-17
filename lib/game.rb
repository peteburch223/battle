
require 'player'
class Game
  MAX_HP = 60
  DAMAGE = 10

  attr_reader :player1, :player2, :now_playing, :opponent


  def self.create(player1_name:, player2_name:, player_class: Player)
    player1 = player_class.new(name:player1_name,hp: MAX_HP, damage: DAMAGE )
    player2 = player_class.new(name:player2_name,hp: MAX_HP, damage: DAMAGE )
    self.new(player1:player1, player2:player2)
  end

  def initialize(player1:, player2:)
    @players = [player1, player2]
    @player1 = player1
    @player2 = player2
    set_players
  end

  def attack(player)
    player.sustain_damage
  end

  def switch
    @players.reverse!
    set_players
  end

  private

  def set_players
    @now_playing = @players.first
    @opponent = @players.last
  end

end
