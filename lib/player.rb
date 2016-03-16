class Player

  MAX_HP = 60
  DAMAGE = 10

  attr_reader :name
  attr_reader :hp

  def initialize(name:, hp:MAX_HP)
    @name = name
    @hp = hp
  end

  def sustain_damage
    @hp -= DAMAGE
  end

end
