class HomeController < ApplicationController
  def index
    @pokemon_products = PokemonProduct.page(params[:page]).per(12)
  end
end
