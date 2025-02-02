require 'poke-api-v2'

# #generate 12 unique numbers to pull pokemon from the API with
def random_numbers(count)
  (1..1017).to_a.sample(count)
end

CartItem.destroy_all
OrderItem.destroy_all
InventoryItem.destroy_all
Order.destroy_all
ShoppingCart.destroy_all
PokemonProduct.destroy_all

random_numbers(48).each do |pokemon_id|
  pokemon = PokeApi.get(pokemon: pokemon_id)
  species = PokeApi.get(pokemon_species: pokemon_id)

  description = species.flavor_text_entries
    .find { |entry| entry.language.name == "en" }&.flavor_text
    .to_s.gsub(/\n|\f/, ' ')

  new_pokemon = PokemonProduct.create!(
    name: pokemon.name.capitalize,
    description: description,
    price: rand(10.0..50.0).round(2),
    pokemon_api_id: pokemon_id,
    sprite_url: pokemon.sprites.front_default
  )
  InventoryItem.create!(
    pokemon_product_id: new_pokemon.id,
    quantity: rand(5..20)
  )
end
