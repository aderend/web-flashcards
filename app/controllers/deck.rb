get "/decks" do
  @decks = Deck.all
  erb :'/decks/index'
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.create(deck_id: params[:id])
  if session[:user]
    @round.user = session[:user]
    @round.save
  end
  erb :"/decks/show"
end

