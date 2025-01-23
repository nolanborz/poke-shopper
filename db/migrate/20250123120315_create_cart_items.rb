class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :pokemon_product, null: false, foreign_key: true
      t.integer :quanitity

      t.timestamps
    end
  end
end
