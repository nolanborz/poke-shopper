class PokemonProduct < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  has_many :inventory_items

  validates :name, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :types, presence: true
  POKEMON_TYPES = %w[
  normal fighting flying poison ground rock bug ghost steel fire water grass electric psychic ice dragon dark fairy].freeze
end
