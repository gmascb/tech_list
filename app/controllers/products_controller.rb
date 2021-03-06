class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.order(:category, :name)
  end

  # GET /products/1 or /products/1.json
  def show
    saved = false
    
    cart = Cart.find(User.find(current_user.id).favorite_cart)
    cart_product = CartProduct.find_by(product_id: @product.id, cart_id: cart.id)

    unless (cart_product.nil?)
      cart_product.destroy
    else
      saved = true
      CartProduct.create(product_id: @product.id, cart_id: cart.id)
    end

    msg = "The item #{@product.name} was " 
    msg += (saved ? "added to" : "removed from") + " the " 
    msg += cart.user.name.split(" ").first + "'s cart"

    flash[:notice] = msg

    redirect_to products_path
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :shared, :category)
    end
end
