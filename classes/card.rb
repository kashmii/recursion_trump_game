class Card
  attr_accessor :suit, :value, :int_value

  def initialize(suit, value, int_value)
    @suit = suit
    @value = value
    @int_value = int_value
  end

  def get_card_string
    "#{@suit}#{@value}(#{@int_value})"
  end
end