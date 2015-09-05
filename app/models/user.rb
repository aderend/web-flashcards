class User < ActiveRecord::Base
  has_many :decks
  has_many :guesses
  has_many :rounds
  has_many :cards, through: :guesses
  has_secure_passowrd
  validates_presence_of :email
  validates_uniqueness_of :email

end
