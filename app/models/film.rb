class Film < ApplicationRecord

  belongs_to :user

  #validation before entering DB
  validates :name, :desc, :director, :cast, :year, presence: true
  validates :year, inclusion: {in:1800..2025, message: "Must be between 1800 and 2025"}
  validates :year, numericality: { only_integer: true }
  validates :name, uniqueness: true

  #for paperclip
  has_attached_file :film_img, styles: { film_index: "250x350>", film_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :film_img, content_type: /\Aimage\/.*\z/
  validates :film_img, attachment_presence: true

end
