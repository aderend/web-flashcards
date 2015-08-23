get "/decks" do
  @decks = Deck.all
  erb :'/decks/index'
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  erb :"/decks/show"
end

post "/decks/:id" do
  @round = Round.create(deck_id: params[:id])
  if sessions[:user_id]
    @round.user_id = sessions[:user_id]
  end
  redirect "/rounds/#{@round.id}"
end
