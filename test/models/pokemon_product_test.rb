require "test_helper"

class PokemonProductTest < ActiveSupport::TestCase
  fixtures :all
  test "using fixtures" do
    pikachu = pokemon_products(:pikachu)
    gyarados = pokemon_products(:gyarados)
    assert pikachu.valid?
    assert gyarados.valid?
  end

  test "product attributes must not be empty" do
    product = PokemonProduct.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:types].any?
  end

  test "product price must be positive" do
    product = PokemonProduct.new(
      name: "Pikachu",
      description: "Pikachu is a small, chubby, mouse-like Pokémon that is covered in yellow fur. It has a lightning bolt-shaped tail and red pouches on its cheeks that store electricity.",
      pokemon_api_id: 25,
      sprite_url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
      types: [ "electric" ]
    )
    product.price = -1
    assert product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ],
      product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ],
      product.errors[:price]
    product.price = 1
    assert product.valid?
  end

  test "can create valid inventory item" do
    product = pokemon_products(:pikachu)  # Use the fixture instead of creating new record

    inventory_item = InventoryItem.new(
      pokemon_product: product,
      quantity: 5
    )
    assert inventory_item.valid?
  end
end
