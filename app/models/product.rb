class Product < ApplicationRecord
  has_many :orders

  validates :name, presence: true, length: { in: 3..20 }
  validates :description, presence: true
  # range is not inclusive
  # therefore {1..99} cent price range
  validates :price, presence: true, numericality: { greater_than: 0.0, less_than: 1.0 }

end
