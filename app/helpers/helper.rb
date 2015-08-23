

def current_user
  user = session[:user] || nil
end

  def new_card(round)
    binding.pry
    current_deck = round.deck.cards
    guessed = round.guesses.select {|guess| guess.correct == true }
    available_cards = current_deck - guessed
    available_cards.sample
  end

  def check_card(guess, card)
    guess.user_guess == card.answer
  end

  def game_completed(round)
    round.guesses.select {|guess| guess.correct == true}.length == round.deck.cards.count
  end
