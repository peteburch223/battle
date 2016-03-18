class Game
  MAX_HP = 20
  DAMAGE = 10
  MAX_PLAYERS = 2

  attr_reader :players, :now_playing, :opponent


  def self.create(player_name:, player_class:)
    @player_class = player_class
    player = @player_class.new(name:player_name,hp: MAX_HP, damage: DAMAGE )
    # self.new(player1:player1, player2:player2)
    @instance = self.new(player:player)
  end

  def self.current_game
    @instance
  end
  def self.reset
    @instance = nil
  end
  def self.player_class
    @player_class
  end

  def initialize(player:)
    @players = []
    @players << player
  end

  def add_player(player_name:)
    player = self.class.player_class.new(name:player_name,hp: MAX_HP, damage: DAMAGE )
    @players << player
  end

  def start_game
    set_players
  end

  def attack(player)
    player.sustain_damage
  end

  def switch
    @players.reverse!
    set_players
  end

  def restart
    @player1.reset_hp MAX_HP
    @player2.reset_hp MAX_HP
    @players = [player1, player2]
    set_players
  end

  def find_opponent_of(player_name)
    @players.select{|player| return player if player.name != player_name}
  end

  private

  def set_players
    @now_playing = @players.first
    @opponent = @players.last
  end

end
