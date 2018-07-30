class Comment < ApplicationRecord

  # -------------------------------------------------- /
  # Exercise 5.7
  # -------------------------------------------------- /
  belongs_to :user
  belongs_to :product

  # Descending order...
  scope :rating_desc, -> { order(rating: :desc) }

  # Ascending order...
  scope :rating_asc, -> { order(rating: :asc) }

  # -------------------------------------------------- /

end
