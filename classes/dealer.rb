class Dealer
  def start_game(amount_of_players, game_mode)
    table = {
      "players" => [],
      "game_mode" => game_mode,
      "deck" => Deck.new(game_mode)
    }

    table["deck"].shuffle_deck

    amount_of_players.times do |i|
      player_card = []
    initial_cards(game_mode).times do
        player_card << table["deck"].draw
      end
      table["players"] << player_card
    end

    table
  end

  def initial_cards(game_mode)
    if game_mode == "21"
      2
    elsif game_mode == "poker"
      5
    end
  end

  # 卓の情報を表示する printTableInformation というメソッドです。
  # このメソッドは、tableという引数を受け取り、卓にいるプレイヤーの数と
  # ゲームモードを表示し、各プレイヤーの手札を表示します
  def self.print_table_information(table)
    output = "Amount of players: " +  table["players"].length.to_s + "... Game mode: " + table["game_mode"] + "\nAt this table: \n"

    table["players"].each_with_index do |_, i|
      output += "Player " + (i + 1).to_s + " Hand is: "
      table["players"][i].each_with_index do |_, j|
        output += table["players"][i][j].get_card_string + " "
      end
      output += "\n"
    end
    output
  end

  def self.score_21_individual(hand)
    hand_value = 0
    hand.each do |card|
      hand_value += card.int_value
    end
    hand_value = 0 if hand_value > 21
    hand_value
  end

  def self.winnerOf21(table)
    # 「各プレイヤーの手札のスコアを計算し、それらを配列に保存
    every_score = []
    table["players"].each do |hand|
      every_score << self.score_21_individual(hand)
    end
    puts every_score

    # スコアのキャッシュを作成
    score_hash = {}
    every_score.each do |v|
      if score_hash[v].nil?
        score_hash[v] = 1
      else
        score_hash[v] += 1
      end
    end
    puts score_hash

    max_score = score_hash.keys.max

    # 最高スコアの人数が1か2以上か0かを判定して結果を返す
    if score_hash[max_score] > 1
      "It is a draw "
    elsif score_hash[max_score] == 1
      "Player " + (every_score.index(max_score) + 1).to_s + " is the winner"
    else
      "No winners..."
    end
  end

  def self.checkWinner(table)
    if table["game_mode"] == "21"
      Dealer.winnerOf21(table)
    else
      "no game"
    end
  end
end