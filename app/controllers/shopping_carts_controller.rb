class ShoppingCartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
  end
end
