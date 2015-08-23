get "/decks" do
  @decks = Deck.all
  erb :'/decks/index'
end

get "/decks/new" do
  if logged_in?
    @deck = Deck.new
    erb :"/decks/new"
  else
    erb :"/users/access_denied"
  end
end

post "/decks" do
  @deck = Deck.new(params[:deck])
  @user = User.find_by(id: session[:user][:id])
  if @deck.save
    @user.decks << @deck
    redirect "/decks"
  else
    redirect "/decks/new"
  end
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.create(deck_id: params[:id])
  if session[:user_id]
    @round.user_id = sessions[:user_id]
  end
  erb :"/decks/show"
end

get "/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  erb :"/decks/edit"
end

put "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  if @deck.update_attributes(params[:deck])
    redirect "/decks"
  else
    erb :"/decks/edit"
  end
end

delete "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  redirect "/decks"
end
