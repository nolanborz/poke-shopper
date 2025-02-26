class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :pokemon_products, through: :order_items

  validates :shipping_name, :shipping_address, :shipping_city, :shipping_state, :shipping_zip, :shipping_country, presence: true
end
