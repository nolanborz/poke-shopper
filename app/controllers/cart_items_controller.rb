# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    # Debug logging
    Rails.logger.debug "=================="
    Rails.logger.debug "Params: #{params.inspect}"
    Rails.logger.debug "Cart Item Params: #{cart_item_params.inspect}"
    Rails.logger.debug "Current Cart: #{@cart.inspect}"
    Rails.logger.debug "=================="

    # Check if item already exists in cart
    cart_item = @cart.cart_items.find_by(pokemon_product_id: cart_item_params[:pokemon_product_id])

    if cart_item
      # Update quantity if item exists
      cart_item.quantity += cart_item_params[:quantity].to_i
      success = cart_item.save
    else
      # Create new cart item if it doesn't exist
      cart_item = @cart.cart_items.build(cart_item_params)
      success = cart_item.save

      # Debug logging for new item
      Rails.logger.debug "New Cart Item: #{cart_item.inspect}"
      Rails.logger.debug "Errors: #{cart_item.errors.full_messages}" if !success
    end

    respond_to do |format|
      if success
        format.html { redirect_back_or_to root_path, notice: "Item added to cart!" }
        format.turbo_stream { flash.now[:notice] = "Item added to cart!" }
      else
        format.html { redirect_back_or_to root_path, alert: "Could not add item to cart." }
        format.turbo_stream { flash.now[:alert] = "Could not add item to cart." }
      end
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Item removed from cart." }
      format.turbo_stream { flash.now[:notice] = "Item removed from cart." }
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:pokemon_product_id, :quantity)
  end
end
