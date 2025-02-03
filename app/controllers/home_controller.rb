class HomeController < ApplicationController
  def index
    @pokemon_products = PokemonProduct.all

    if params[:types].present?
      @pokemon_products = @pokemon_products.where("types && ARRAY[?]::varchar[]", params[:types])
    end

    @pokemon_products = @pokemon_products.page(params[:page]).per(12)
  end
end
