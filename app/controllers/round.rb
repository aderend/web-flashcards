require 'pry'

get "/rounds/:id" do
  @round = Round.find_by(id: params[:id])
  @card = new_card(@round.id)

  if @card==nil
    erb :"/rounds/stats"
  else
    erb :"/rounds/show"
  end
end

post "/rounds/:round_id/guesses" do
  @round  = Round.find_by(id: params[:round_id])
  @card = Card.find_by(id: params[:card].to_i)

  @guess = Guess.create(user_guess: params[:guess], card_id: @card.id, round_id: @round.id)
  if check_card(@guess, @card)
    @guess.update_attributes(correct: true)

    if @round.guesses.find_by(card_id: @card.id, correct: false) == nil
      @round.score += 1
    end
    @round.save
  end
  redirect "/rounds/#{@round.id}"
end



