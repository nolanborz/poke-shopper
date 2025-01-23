class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :pokemon_product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price_at_time_of_purchase

      t.timestamps
    end
  end
end
