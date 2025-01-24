# db/seeds.rb
require 'poke-api-v2'

PokemonProduct.destroy_all

[ 1, 4, 7, 25, 133, 149 ].each do |pokemon_id|
  pokemon = PokeApi.get(pokemon: pokemon_id)
  species = PokeApi.get(pokemon_species: pokemon_id)

  description = species.flavor_text_entries
    .find { |entry| entry.language.name == "en" }&.flavor_text
    .to_s.gsub(/\n|\f/, ' ')

  PokemonProduct.create!(
    name: pokemon.name.capitalize,
    description: description,
    price: rand(10.0..100.0).round(2),
    pokemon_api_id: pokemon_id
  )
end
