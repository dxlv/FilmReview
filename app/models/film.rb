class Film < ApplicationRecord

  belongs_to :user

  #validation before entering DB
  validates :name, :desc, :director, :cast, :year, presence: true
  validates :year, inclusion: {in:1800..2025, message: "Must be between 1800 and 2025"}
  validates :year, numericality: { only_integer: true }
  validates :name, uniqueness: true
end
