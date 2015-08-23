require 'pry'
get '/decks/:deck_id/rounds/:round_id' do
  @deck = Deck.find_by[id: params[:deck_id]]
  @round = Round.find_by(id: params[:id])
  @round.user_id = session[:user_id] if session[:user_id]
  @card =  @deck.cards.shuffle!.first
  erb :'cards/show'
end

post '/decks/:deck_id/rounds/:round_id/cards/:card_id' do
  @guess = Guess.create(user_guess: params[:guess])
  @guess.card = Card.find_by(id: params[:card_id])
  @guess.round = Round.find_by(id: params[:round_id])
  if @guess.user_guess == @guess.card.answer
    @guess.round.score += 1 unless Guess.find_by(card_id: params[:card_id], round_id: params[:round_id])
    @guess.correct=true
  end

  @guess.round.deck.detect do |card|
    guess_storing = Guess.find_by(card_id: card.id)
    if guess_storing == false
      return guess_storing.
  end
  # we need to choose a random card whose guess.correct attribute is eqaul to false

end















# post '/index/decks/:deck_id/rounds/:round_id/cards' do
#   @round = Round.find_by(id: params[:round_id])
#   @round.user_id = session[:user_id] if session[:user_id]
#   @deck = Deck.find_by(id: params[:deck_id])
#   @current_card = @deck.cards.first
#   while @deck.cards.select {|card| card.correct}.length != @deck.cards.length
#     @current_card = @deck.cards.detect {|card| !card.correct}
#     @guess = Guess.new(user_guess: params[:guess], card_id: @current_card.id)
#     if @guess.user_guess == @guess.card.answer
#       @guess.card.update_attributes(correct: true)
#       @next_card = @deck.cards.detect {|card| !card.correct}
#       redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{@next_card.id}"
#     else
#       @current_card.update_attributes(passed: true)
#       @deck.cards.rotate
#       @next_card = @deck.cards.detect {|card| !cards ard.correct}
#       redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{@next_card.id}"
#     end
#   end
#   @deck.cards.each {|card| card.update_attributes(correct: false)}
#   @deck.cards.each {|card| card.update_attributes(passed: false)}
#   redirect "/index/decks/#{@deck.id}"
# end
