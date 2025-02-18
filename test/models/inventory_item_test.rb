require "test_helper"

class InventoryItemTest < ActiveSupport::TestCase
  setup do
    @pokemon_product = pokemon_products(:pikachu)
  end

  test "inventory item requires a pokemon product" do
    inventory_item = InventoryItem.new(quantity: 5)
    assert inventory_item.invalid?
    assert_includes inventory_item.errors[:pokemon_product], "must exist"
  end

  test "inventory item requires a quantity" do
    inventory_item = InventoryItem.new(pokemon_product: @pokemon_product)
    assert inventory_item.invalid?
    assert_includes inventory_item.errors[:quantity], "can't be blank"
  end
end
