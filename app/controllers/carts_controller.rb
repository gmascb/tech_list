class CartsController < ApplicationController
    def index
        if current_user.nil?
            redirect_to root_path, notice: "É necessário fazer login..."
        else

            @cart = Cart.by_user(current_user)
            cp = CartProduct.where(cart_id: @cart.id)
            
            @products = []
            cp.each{ |cp| @products << Product.find(cp.product_id) }
        end
    end


    def finish
        if current_user.nil?
            redirect_to root_path, notice: "É necessário fazer login..."
        else
            @cart = Cart.by_user(current_user)
            CartProduct.where(cart_id: @cart.id).destroy_all
        end

        redirect_to products_path
    end

end
  