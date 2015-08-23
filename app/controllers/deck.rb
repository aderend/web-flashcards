get "/index/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @card = @deck.cards.first
  @round = Round.create
  erb :'decks/show'
end

get "/decks" do
  @decks = Deck.all
  erb :"decks/index"
end

get "/decks/new" do
  @deck = Deck.new
  @card = Card.new
  if logged_in?
    erb :"/decks/new"
  else
    erb :"/users/access_denied"
  end
end

post "/decks" do
  @deck = Deck.new(params[:deck])
  user_id = session[:user][:id]
  @user = User.find_by(id: user_id)
  # @user = User.find_by(id: params[:id])
  if @deck.save
    @user.decks << @deck
    redirect "/"
  else
    redirect "/decks/new"
  end
end

get "/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  user_id = session[:user][:id]
  @user = User.find_by(id: user_id)
  # @user = User.find_by(id: params[:user_id])
  # if @deck.user_id == params[:user_id]
  erb :"/decks/edit"
  # end
end

put "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  if @deck.update_attributes(params[:deck])
    redirect "/"
  else
    erb :"/decks/edit"
  end
end

delete "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  redirect "/"
end
