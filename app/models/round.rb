class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses
end



def play(round)

  while @deck.cards.select {|card| card.correct}.length != @deck.cards.length
      @current_card = @deck.cards.detect {|card| !card.correct}
      @guess = Guess.new(user_guess: params[:guess], card_id: @current_card.id)
    if @guess.user_guess == @guess.card.answer
        @guess.card.update_attributes(correct: true)
        @next_card = @deck.cards.detect {|card| !card.correct}
        redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{@next_card.id}"
    else
        @current_card.update_attributes(passed: true)
        @deck.cards.rotate
        @next_card = @deck.cards.detect {|card| !card.correct}
        redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{@next_card.id}"
    end
  end
