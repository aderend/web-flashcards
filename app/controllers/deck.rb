get "/decks" do
  @decks = Deck.all
  erb :'/decks/index'
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.create(deck_id: params[:id])
  if session[:user_id]
    @round.user_id = sessions[:user_id]
  end
  erb :"/decks/show"
end

# post "/decks" do
#   @round = Round.create(deck_id: params[:id])
#   if session[:user_id]
#     @round.user_id = sessions[:user_id]
#   end
#   redirect "/rounds/#{@round.id}"
# end
