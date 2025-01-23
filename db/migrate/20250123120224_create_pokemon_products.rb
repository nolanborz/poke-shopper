class CreatePokemonProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemon_products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :pokemon_api_id

      t.timestamps
    end
  end
end
