class Game

  attr_reader :player1, :player2, :now_playing, :opponent

  def initialize(player1:, player2:)
    @player1 = player1
    @player2 = player2
    @now_playing = player1
    @opponent = player2
  end

  def attack(player)
    player.sustain_damage
  end

  def switch
    @now_playing = (@now_playing.name == @player1.name ? @player2 : @player1)
    @opponent = (@opponent.name == @player1.name ? @player2 : @player1)
  end

end
