class AddTypeToPokemonProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :pokemon_products, :types, :string, array: true, default: []
  end
end
