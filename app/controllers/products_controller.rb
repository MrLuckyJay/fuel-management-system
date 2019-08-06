class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:login, :signup]
  #before_action :require_same_user, only:[:edit,:update,:destroy]

  # GET /products
  # GET /products.json
  def index
    @current_user = current_user
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @current_user = current_user
  end

  # GET /products/new
  def new
    
    @product = Product.new
    @user = current_user
    @current_user = current_user
  end

  # GET /products/1/edit
  def edit
    @current_user = current_user
  end

  # POST /products
  # POST /products.json
  def create
   
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

    @current_user = current_user
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @current_user = current_user
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @current_user = current_user
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:productName, :productPrice, :user_id)
    end
end
