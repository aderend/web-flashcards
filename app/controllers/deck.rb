get '/index/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @card = @deck.cards.first
  @round = Round.create
  erb :'decks/show'
end
