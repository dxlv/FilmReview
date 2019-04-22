class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :zxcvbnable, :confirmable, :lockable

  def weak_words
       [self.email, self.username]
  end

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :email, :username, :password, presence: true
  #validates :password,
end
