module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.shopping_cart || create_user_cart
    else
      @cart = find_or_create_session_cart
    end
  end

  def create_user_cart
    cart = ShoppingCart.create(user: current_user)
    migrate_session_cart_to_user(cart) if session[:cart_id]
    cart
  end

  def find_or_create_session_cart
    cart = ShoppingCart.find_by(id: session[:cart_id])
    return cart if cart.present?

    cart = ShoppingCart.create
    session[:cart_id] = cart.id
    cart
  end

  def migrate_session_cart_to_user(user_cart)
    session_cart = ShoppingCart.find_by(id: session[:cart_id])
    return unless session_cart

    session_cart.cart_items.each do |item|
      existing_item = user_cart.cart_items.find_by(pokemon_product_id: item.pokemon_product_id)

      if existing_item
        existing_item.quantity += item.quantity
        existing_item.save
      else
        item.update(shopping_cart: user_cart)
      end
    end

    session_cart.destroy
    session.delete(:cart_id)
  end
end
