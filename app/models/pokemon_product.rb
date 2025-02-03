class PokemonProduct < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  has_many :inventory_items
  POKEMON_TYPES = %w[
  normal fighting flying poison ground rock bug ghost steel fire water grass electric psychic ice dragon dark fairy].freeze
end
