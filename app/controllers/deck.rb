get "/decks" do
  @decks = Deck.all
  @users = User.all
  erb :'/decks/index'
end

get "/decks/new" do
  @deck = Deck.new
  erb :'decks/new'
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.create(deck_id: params[:id])
  @creator = User.find_by(id: @deck.creator_id)
  if session[:user]
    @round.user = session[:user]
    @round.save
  end
  erb :"/decks/show"
end

post "/decks/new" do
  @deck = Deck.new(params[:deck])
  @deck.creator_id = session[:user][:id]
  if @deck.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    erb :'/decks/bad_deck'
  end
end

get "/decks/:id/edit" do
     @deck = Deck.find_by(id: params[:id])

    if session[:user][:id] == @deck.creator_id
      erb :"/decks/edit"
    else
      erb :"/decks/access_denied"
    end
end

post "/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  redirect "/decks/#{@deck.id}/cards/new"
end

delete "/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  redirect "/decks"
end
