get "/cards" do
  @cards = Card.all
  erb :"/cards/index"
end

get "/cards/new" do
  @card = Card.new
  erb :"/cards/new"
end

post "/cards" do
  @card = Card.new(params[:card])
  if @card.save
    redirect "/cards"
  else
    erb :"/cards/new"
  end
end

get "/cards/:id/edit" do
  @card = Card.find_by(id: params[:id])
  erb :"/cards/edit"
end

get "/cards/:id" do
  @card = Card.find_by(id: params[:id])
  erb :"/cards/show"
end

put "/cards/:id" do

end

delete "/cards/:id" do
  @card = Card.find_by(id: params[:id])
  @card.destroy
  redirect "/cards"
end
