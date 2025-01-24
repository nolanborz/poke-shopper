class HomeController < ApplicationController
  def index
    @pokemon_products = PokemonProduct.all
  end
end
