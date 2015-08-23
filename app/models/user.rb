class User < ActiveRecord::Base
  has_many :decks
  has_many :guesses
  has_many :rounds
  has_many :cards, through: :guesses

  validates_presence_of :email, :password_hash
  validates_uniqueness_of :email

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.auth(email, cleartext_pw)
    user = User.find_by(email: email)
    if user
      return user if user.password == cleartext_pw
      nil
    else
      nil
    end
  end

end
