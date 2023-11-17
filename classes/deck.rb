class Deck
  def initialize(game_mode=nil)
    @deck = Deck.generate_deck(game_mode)
  end

  # クラスメソッドでデッキを生成する（initializeではない）
  def self.generate_deck(game_mode=nil)
    new_deck = []
    suits = ["♠", "♥", "♦", "♣"]
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

    blackjack = {
      "A" => 1,
      "J" => 10,
      "Q" => 10,
      "K" => 10
    }

    suits.each do |suit|
      values.each_with_index do |value, index|
        # blackjackの場合: 文字列ならhashから値取得、数値ならint型に変換
        int_value = (game_mode == "21") ? (blackjack.include?(value) ? blackjack[value] : value.to_i) : index + 1
        new_deck << Card.new(suit, value, int_value)
      end
    end
    new_deck
  end

  def print_deck
    puts "Displaying cards..."
    @deck.each do |card|
      puts card.get_card_string
    end
  end

  # デッキからカードを 1 枚ドローする動作を考えましょう。
  # デッキは配列で表されており、pop 関数を使うことで、最後のカードを取り出すことができます。
  # このプログラムでは、draw 関数を呼び出すことで、最後のカードを取得し、それを返します。
  # これにより、カードを引くことができます。
  def draw
    @deck.pop
  end

  def shuffle_deck
    # 一発でできる方法
    # @deck.shuffle!

    # random関数を使う方法
    deck_size = @deck.size
    deck_size.times do |index|
      j = rand(deck_size)
      temp = @deck[index]
      @deck[index] = @deck[j]
      @deck[j] = temp
    end
  end
end