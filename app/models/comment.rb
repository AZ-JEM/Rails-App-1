class Comment < ApplicationRecord

  # Exercise 5.9
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :product

  # Descending order...
  scope :rating_desc, -> { order(rating: :desc) }

  # Ascending order...
  scope :rating_asc, -> { order(rating: :asc) }

end
