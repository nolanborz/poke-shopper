class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :pokemon_product
end
