require "./classes/card"
require "./classes/deck"

# ========================================

deck1 = Deck.new
card1 = Card.new("◆", "A", 1)

# deck1.print_deck
deck1.shuffle_deck
# deck1.print_deck
# puts deck1[0].get_card_string
puts deck1.instance_variable_get(:@deck)[51].get_card_string
puts deck1.draw.get_card_string
