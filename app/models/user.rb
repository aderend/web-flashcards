class User < ActiveRecord::Base
  has_many :decks
  has_many :guesses
  has_many :rounds
  has_many :cards, through: :guesses
end
