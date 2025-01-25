class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :pokemon_products, through: :order_items
end
