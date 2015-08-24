
get "/decks/:deck_id/cards/new" do
  @deck = Deck.find_by(id: params[:deck_id])
  @card= Card.new
  erb :"/cards/new"
end

post "/decks/:deck_id/cards/new" do
  @card = Card.new(params[:card])
  if @card.save
    @deck = Deck.find_by(id: params[:deck_id])
    @deck.cards << @card
    @deck.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    @deck = Deck.find_by(id: params[:deck_id])
    erb :"/cards/bad_card"
  end
end

get "/cards/:id/edit" do
  @card = Card.find_by(id: params[:id])
  erb :"/cards/edit"
end

post "/cards/:id/edit" do
  @card = Card.new
  @card.question=params[:card][:question]
  @card.answer=params[:card][:answer]
  if @card.save
    redirect "/decks/#{@card.deck_id}/edit"
  else
    erb :'/cards/bad_edit'
  end
end

put "/cards/:id/edit" do
  @card = Card.find_by(id: params[:id])
  @card.question=params[:card][:question]
  @card.answer=params[:card][:answer]
  if @card.save
    redirect "/decks/#{@card.deck_id}/edit"
  else
    erb :'/cards/bad_edit'
  end
end

delete "/cards/:id/edit" do
  @card = Card.find_by(id: params[:id])
  @card.destroy
  redirect "/decks/#{@card.deck_id}/edit"
end



