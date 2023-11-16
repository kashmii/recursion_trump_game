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

    table["players"]
  end

  def initial_cards(game_mode)
    if game_mode == "21"
      2
    elsif game_mode == "poker"
      5
    end
  end
end