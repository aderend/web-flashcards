# get '/index/decks/:id' do
#   @deck = Deck.find_by(id: params[:id])
#   @card = @deck.cards.first
#   @round = Round.create
#   @round.deck = @deck
#   erb :'rounds/start'
# end
get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  erb :"/decks/show"
end

post "/decks/:id" do
  @round = Round.create(deck_id: params[:id])
  @round.user = current_user
  # require 'pry'
  # binding.pry
  redirect "/rounds/#{@round.id}"
end
