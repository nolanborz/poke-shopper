class InventoryItem < ApplicationRecord
  belongs_to :pokemon_product
  validates :quantity, presence: true
end
