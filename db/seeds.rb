
deck1 = Deck.create(name: 'math', creator_id: 1)
user1 = User.create(name: 'Derpson', username: 'derpson', password:  'foo')

deck1.cards << Card.create(question: "What's 1+1", answer: "2")
deck1.cards << Card.create(question: "What's 2+2", answer: "4")
deck1.cards << Card.create(question: "What's 4+4", answer: "8")
deck1.cards << Card.create(question: "What's 5+5", answer: "10")



# we will need a module in here to parse array
# class Deck
#   attr_reader :cards, :file
#   def initialize(file)
#     @file = file
#     @cards = import(file)
#   end

#   def import(file)
#     File.read(file).each_slice(3) do |answer, question, space|
#       Card.new(answer: answer.chomp, question: question.chomp)
#     end
#   end
# end
