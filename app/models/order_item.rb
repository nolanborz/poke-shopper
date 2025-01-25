class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pokemon_product
  validates :quantity, presence: true
  validates :price_at_time_of_purchase, presence: true
end
