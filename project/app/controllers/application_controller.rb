class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :current_user, :user_signed_in?

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:thename, :email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:thename])
    end


    private
        def current_cart
            Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
            cart = Cart.create
            session[:cart_id] = cart.id
            cart
        end
end
