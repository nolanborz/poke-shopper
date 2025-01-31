class MakeUserOptionalInShoppingCarts < ActiveRecord::Migration[7.2]
  def up
    change_column_null :shopping_carts, :user_id, true
  end

  def down
    # First, remove any shopping carts without users to avoid constraint violations
    ShoppingCart.where(user_id: nil).destroy_all
    change_column_null :shopping_carts, :user_id, false
  end
end
