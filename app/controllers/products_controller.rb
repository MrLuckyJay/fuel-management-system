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

   
      if @product.save
       redirect_to @product
       flash[:success]='Product was successfully created.' 
      else
        render :new
        flash[:danger]='errors prevented the product from been created'
      end
    

    @current_user = current_user
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @current_user = current_user
   
      if @product.update(product_params)
        redirect_to @product
        flash[:success]='Product was successfully updated.'
      else
       render :edit 
       flash[:danger]='errors prevented the product from been updated'
      end
    
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @current_user = current_user
    @product.destroy
     redirect_to products_url 
     flash[:danger] = 'Product was successfully destroyed.'
    
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
