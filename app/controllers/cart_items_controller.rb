# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    cart_item = @cart.cart_items.find_by(pokemon_product_id: cart_item_params[:pokemon_product_id])

    if cart_item
      cart_item.quantity += cart_item_params[:quantity].to_i
      success = cart_item.save
    else
      cart_item = @cart.cart_items.build(cart_item_params)
      success = cart_item.save
    end

    respond_to do |format|
      if success
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.replace("cart_items", partial: "shopping_carts/cart_items", locals: { cart: @cart }),
            turbo_stream.replace("cart_total", partial: "shopping_carts/cart_total", locals: { cart: @cart }),
            turbo_stream.replace("cart_count", partial: "shared/cart_count", locals: { cart: @cart })
          ]
        }
        format.html { redirect_back_or_to root_path, notice: "Item added to cart!" }
      else
        format.html { redirect_back_or_to root_path, alert: "Could not add item to cart." }
      end
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.replace("cart_items", partial: "shopping_carts/cart_items", locals: { cart: @cart }),
          turbo_stream.replace("cart_total", partial: "shopping_carts/cart_total", locals: { cart: @cart }),
          turbo_stream.replace("cart_count", partial: "shared/cart_count", locals: { cart: @cart })
        ]
      }
      format.html { redirect_to cart_path, notice: "Item removed from cart." }
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:pokemon_product_id, :quantity)
  end
end
