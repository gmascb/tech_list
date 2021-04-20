class CartsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index

        @cart = Cart.by_user(current_user)
        cp = CartProduct.where(cart_id: @cart.id)
        
        @products = []
        cp.each{ |cp| @products << Product.find(cp.product_id) }

        @my_cart_contributors = []
        @cart_contributors = CartContributor.my_carts(current_user.id)

        @cart_contributors.each do |cc|
            @my_cart_contributors << cc.cart unless cc.cart.user.id == current_user.id
        end

    end


    def finish
        if current_user.nil?
            redirect_to root_path, notice: "You need to login..."
        else
            @cart = Cart.by_user(current_user)
            CartProduct.where(cart_id: @cart.id).destroy_all
        end

        redirect_to products_path
    end

    def add_contributor
        if params[:user_id].to_i.zero?
            redirect_to cart_path, notice: "You need to select an user..."
        else
            CartContributor.find_or_create_by(user_id: params[:user_id].to_i, cart_id: params[:cart_id].to_i)
            redirect_to cart_path, notice: "#{User.find(params[:user_id]).name} was added to the cart!"
        end
    end

    def alter_cart
        puts " Alterando para carrinho favorito #{params[:carrinho].to_i} do usuário #{current_user.name}"
        current_user.update!(favorite_cart: params[:carrinho].to_i) if params[:carrinho].to_i > 0
        puts "Carrinho alterado para #{current_user.favorite_cart}"
    end

    #Removing someone from my cart
    def remove_contributor
        CartContributor.find_by(user_id: params[:user_id], 
                                cart_id: Cart.find_by(user_id: current_user.id)).destroy
        
        redirect_to cart_path, notice: "#{User.find(params[:user_id]).name} was removed from the cart!"
    end

    # Me leaving someone's cart
    def leave_cart
        CartContributor.find_by(user_id: current_user.id, cart_id: params[:cart_id]).destroy
        redirect_to cart_path, notice: "You leave #{Cart.find(params[:cart_id]).user.name.split(" ").first}'s cart!"
    end

end
  