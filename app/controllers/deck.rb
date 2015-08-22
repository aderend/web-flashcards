get "/index/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @card = @deck.cards.first
  @round = Round.create
  erb :'decks/show'
end

get "/users/:user_id/decks/new" do
  @deck = Deck.new
  @card = Card.new
  if logged_in?
    erb :"/decks/new"
  else

  user_id = session[:user][:id]
  # @user = User.find_by(id: user_id)
  # @user = User.find_by(id: params[:user_id])
end

post "/users/:id/decks" do
  # binding.pry
  @deck = Deck.new(params[:deck])
  @user = User.find_by(id: params[:id])
  if @deck.save
    @user.decks << @deck
    redirect "/"
  else
    redirect "/users/#{@user.id}/decks/new"
  end
end

get "/users/:user_id/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  @user = User.find_by(id: params[:user_id])
  # if @deck.user_id == params[:user_id]
  erb :"/decks/edit"
  # end
end

put "/users/:user_id/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  if @deck.update_attributes(params[:deck])
    redirect "/"
  else
    erb :"/decks/edit"
  end
end

delete "/users/:user_id/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  redirect "/"
end
