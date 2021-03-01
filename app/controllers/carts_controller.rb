class CartsController < ApplicationController
    def index
        
        @cart = Cart.by_user(current_user)
        cp = CartProduct.where(cart_id: @cart.id)
        
        @products = []
        cp.each{ |cp| @products << Product.find(cp.product_id) }

    end
end
  