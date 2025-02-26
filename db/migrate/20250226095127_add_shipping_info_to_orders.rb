class AddShippingInfoToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_address, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_state, :string
    add_column :orders, :shipping_zip, :string
    add_column :orders, :shipping_country, :string
    add_column :orders, :phone_number, :string
  end
end
