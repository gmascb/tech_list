class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :validate_user
    
    def validate_user

        add_carts_to_user(current_user)

        controllers = ["home", "sessions"]
        msg = "É necessário estar logado para usar o sistema."

        if current_user.nil?
            redirect_to root_path, notice: msg unless controllers.include?(request[:controller])
        end 
        
    end

    private 

    def add_carts_to_user(user)
        if user && user.favorite_cart.nil?
            cart = Cart.find_or_create_by!(user_id: user.id)
            user.update!(favorite_cart: cart.id)
        end
    end
 
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
