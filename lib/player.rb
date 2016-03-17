class Player

  attr_reader :name
  attr_reader :hp

  def initialize(name:, hp:, damage:)
    @name = name
    @hp = hp
    @damage = damage
  end

  def sustain_damage
    @hp -= @damage
  end

end
