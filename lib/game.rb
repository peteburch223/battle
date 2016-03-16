class Game

  attr_reader :player1, :player2, :now_playing

  def initialize(player1:, player2:)
    @player1 = player1
    @player2 = player2
    @now_playing = player1
  end

  def attack
    switch
    now_playing.sustain_damage
  end

  def switch
    @now_playing = (@now_playing.name == @player1.name ? @player2 : @player1)
  end

end
