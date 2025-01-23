class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pokemon_product
end
