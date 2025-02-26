class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!
  def new
    @order = current_user.orders.build(status: "pending")
  end
  def create
    @order = current_user.orders.build(order_params)
    @order.status = "processing"

    if @order.save
      @cart.cart_items.each do |cart_item|
        @order.order_items.create(
          pokemon_product_id: cart_item.pokemon_product_id,
          quantity: cart_item.quantity,
          price_at_time_of_purchase: cart_item.pokemon_product.price
        )
      end

      @cart.cart_items.destroy_all

      redirect_to order_path(@order), notice: "Your order has been placed successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  private

  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address, :shipping_city, :shipping_state, :shipping_zip, :shipping_country, :phone_number)
  end
end
