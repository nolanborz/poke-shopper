class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :pokemon_products, through: :cart_items

  def total_price
    cart_items.sum { |item| item.pokemon_product.price * item.quantity }
  end

  def total_items
    cart_items.sum(:quantity)
  end
end
