class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :pokemon_products, through: :cart_items
end
