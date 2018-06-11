class Product < ApplicationRecord
  has_many :orders

  validates :name, presence: true, length: { in: 3..20 }
  validates :description, presence: true
  validates :price, presence: true

end
