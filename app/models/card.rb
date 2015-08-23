class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  validates_presence_of :question, :answer
  validates_uniqueness_of :question
end
