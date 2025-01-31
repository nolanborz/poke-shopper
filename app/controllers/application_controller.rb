# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email ])
    def manifest
    render json: {
      name: "PokéShop",
      short_name: "PokéShop",
      start_url: "/",
      display: "standalone",
      background_color: "#fff",
      description: "A Pokémon Shopping Experience",
      icons: [
        {
          src: "/icon.png",
          sizes: "192x192",
          type: "image/png"
        }
      ]
    }
  end
end

  # Override the default behavior after sign in
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || super
  end
end
