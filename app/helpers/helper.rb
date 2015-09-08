

def current_user
  user = session[:user_id] || nil
end

  def new_card(round_id)
    round = Round.find_by(id: round_id)
    current_deck = round.deck.cards

    guessed = round.guesses.select {|guess| guess.correct == true }

    guessed_cards = guessed.each_with_object([]) do |guess_obj, array|
      array << current_deck.find_by(id: guess_obj.card_id)
    end

    available_cards = current_deck - guessed_cards

    available_cards.sample if available_cards

  end

  def check_card(guess, card)
    guess.user_guess.downcase == card.answer.downcase
  end

  def game_completed(round)
    round.guesses.select {|guess| guess.correct == true}.length == round.deck.cards.count
  end

