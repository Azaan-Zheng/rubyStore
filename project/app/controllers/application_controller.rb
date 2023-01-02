class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :current_user, :user_signed_in?

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:thename, :email, :thephone])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:thename])
    end


    private
        def current_cart
            if current_user.cart.nil?
                cart = Cart.create
                session[:cart_id] = cart.id
                current_user.cart = cart
                return cart
            else
                return current_user.cart
            end
        end
end
