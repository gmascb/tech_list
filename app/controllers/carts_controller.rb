class CartsController < ApplicationController
    skip_before_action :verify_authenticity_token

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

    def add_contributor
        CartContributor.find_or_create_by!(user_id: params[:user_id].to_i, cart_id: params[:cart_id].to_i)
        redirect_to cart_path, notice: "#{User.find(params[:user_id]).name} foi adicionado no carrinho"
    end

    def alter_cart
        puts " Alterando para carrinho favorito #{params[:carrinho].to_i} do usuário #{current_user.name}"
        current_user.update!(favorite_cart: params[:carrinho].to_i) if params[:carrinho].to_i > 0
        puts "Carrinho alterado para #{current_user.favorite_cart}"
    end

end
  