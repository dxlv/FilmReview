class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  validates :rating, :comment, presence: true
  #validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: {in:0..5, message: "Must be between 0 and 5"}
end
