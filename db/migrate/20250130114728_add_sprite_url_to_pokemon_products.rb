class AddSpriteUrlToPokemonProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :pokemon_products, :sprite_url, :string
  end
end
