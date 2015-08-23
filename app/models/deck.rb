class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :users, through: :rounds

  validates_presence_of :name
  validates_uniqueness_of :name
end
