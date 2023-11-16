require "./classes/card"
require "./classes/deck"
require "./classes/dealer"

# ========================================

# deck1 = Deck.new
# card1 = Card.new("◆", "A", 1)
table1 = Dealer.new.start_game(3, "poker")


# deck1.shuffle_deck

# puts  "#{table1[0][0].get_card_string} #{table1[0][1].get_card_string}"
# puts  "#{table1[1][0].get_card_string} #{table1[1][1].get_card_string}"
# puts  "#{table1[2][0].get_card_string} #{table1[2][1].get_card_string}"

his_hands = ""
table1[0].each do |card|
  his_hands << card.get_card_string + " "
end
puts his_hands

# deckのインスタンス変数にアクセスして1枚目のカードを取得する方法
# puts deck1.instance_variable_get(:@deck)[51].get_card_string

# puts deck1.draw.get_card_string
