class Deck
  def initialize
    @deck = Deck.generate_deck
  end

  # クラスメソッドでデッキを生成する（initializeではない）
  def self.generate_deck
    new_deck = []
    suits = ["♠", "♥", "♦", "♣"]
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

    suits.each do |suit|
      values.each_with_index do |value, index|
        new_deck << Card.new(suit, value, index + 1)
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