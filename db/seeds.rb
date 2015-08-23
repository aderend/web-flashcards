user = User.create(name: "Deren", email:"yada@gmail.com", password_hash: "password")
deck1 = Deck.create(name: 'math', number_of_cards: 2)

user.decks << deck1

deck1.cards << Card.create(question: "What's 1+1", answer: "2")
deck1.cards << Card.create(question: "What's 2+2", answer: "4")
deck1.cards << Card.create(question: "What's 4+4", answer: "8")

# round1 = Round.create(deck_id: 1, user_id: 1)
# guess1 = Guess.create(card_id: 1, user_id: 1, user_guess: "apple")


# we will need a module in here to parse array
class Deck
  attr_reader :cards, :file
  def initialize(file)
    @file = file
    @cards = import(file)
  end

  def import(file)
    File.read(file).each_slice(3) do |answer, question, space|
      Card.new(answer: answer.chomp, question: question.chomp)
    end
  end
end
