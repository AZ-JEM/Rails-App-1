class Product < ApplicationRecord

  validates :name, presence: true, length: { in: 3..20 }
  validates :description, presence: true
  # range is not inclusive
  # therefore {1..99} cent price range
  validates :price, presence: true, numericality: { greater_than: 0.0, less_than: 1.0 }

  has_many :orders

  # -------------------------------------------------- /
  # Exercise 5.7
  # -------------------------------------------------- /
  has_many :comments

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.rating_asc.average(:rating)
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end
  # -------------------------------------------------- /

end
