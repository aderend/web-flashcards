class User < ActiveRecord::Base

  include BCrypt

  has_many :decks
  has_many :guesses
  has_many :rounds
  has_many :cards, through: :guesses
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username

end
