class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :current_user, :user_signed_in?, :user_admin?
    helper_method :current_cart, :current_starfold

    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:thename, :email, :thephone])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:thename])
    end

    def authenticate_admin
        if current_user.thetype == 1
            redirect_to store_url
        end
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

        def current_starfold
            if current_user.starfold.nil?
                starfold = Starfold.create
                session[:starfold_id] = starfold.id
                current_user.starfold = starfold
                return starfold
            else
                return current_user.starfold
            end
        end
            

        def user_admin?
            current_user.thetype == 2
        end
                
end
