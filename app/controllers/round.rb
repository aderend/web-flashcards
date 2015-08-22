require 'pry'
get '/decks/:deck_id/rounds/:id' do
  @deck = Deck.find_by[id: params[:deck_id]]
  @round = Round.find_by(id: params[:id])
  @guess = Guess.new
  @round.user_id = session[:user_id] if session[:user_id]
  erb :'rounds/start'
end

post '/index/decks/:deck_id/rounds/:round_id/cards' do
  @round = Round.find_by(id: params[:round_id])
  @round.user_id = session[:user_id] if session[:user_id]
  @deck = Deck.find_by(id: params[:deck_id])
  # @card = @deck.cards.first
  while @deck.cards.all.select {|card| card.correct}.length != @deck.cards.length
    current_card = @deck.cards.all.detect {|card| !card.correct}
    if params[:guess] == current_card.answer
      current_card.update_attributes(correct: true)
      next_card = @deck.cards.all.detect {|card| !card.correct}
      if next_card == nil
        @deck.cards.each {|card| card.update_attributes(correct: false)}
        break
      end
      redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{next_card.id}"
    else
      current_card.passed = true
      next_card = @deck.cards.all.rotate.detect {|card| !card.correct}
      redirect "/index/decks/#{@deck.id}/rounds/#{@round.id}/cards/#{next_card.id}"
    end
  end

  @deck.cards.each {|card| card.update_attributes(correct: false)}

  redirect "/index/decks/#{@deck.id}"
end
