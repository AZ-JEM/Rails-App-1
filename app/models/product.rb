class Product < ApplicationRecord
  has_many :orders

  validates :name, presence: true, length: { in: 3..20 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { less_than: 0.99, greater_than: 0.05 }

end
