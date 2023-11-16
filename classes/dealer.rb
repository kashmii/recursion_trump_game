class Dealer
  def start_game(amount_of_players, game_mode)
    table = {
      "players" => [],
      "game_mode" => game_mode,
      "deck" => Deck.new
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
end