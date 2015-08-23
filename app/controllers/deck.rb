get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  # @card = @deck.cards.first
  @round = Round.create
  @deck.round = @round
  erb :'decks/show'
end
