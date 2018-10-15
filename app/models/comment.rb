class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :product

  # Descending order...
  scope :rating_desc, -> { order(rating: :desc) }

  # Ascending order...
  scope :rating_asc, -> { order(rating: :asc) }

  # Exercise 5.9
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # Exercise 6.14c
  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }

end
