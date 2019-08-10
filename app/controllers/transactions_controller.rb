class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:login, :signup]
  #before_action :require_same_user, only:[:edit,:update,:destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
    @current_user = current_user
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @current_user = current_user
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @user = current_user
    @products = Product.all
    @current_user = current_user
  end

  # GET /transactions/1/edit
  def edit
    @current_user = current_user
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @current_user = current_user
    @transaction = Transaction.new(transaction_params)

   
      @current_user = current_user
      if @transaction.save
        redirect_to @transaction
        flash[:success]='Transaction was successfully created.'
      else
        render :new
        flash[:danger]='Error Creating Transaction.'
      end
   
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    @current_user = current_user
  
      if @transaction.update(transaction_params)
       redirect_to @transaction
       flash[:success]='Transaction was successfully updated.'
      else
        render :edit 
        flash[:danger]='Error UdatingTransaction.'

      end
   
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @current_user = current_user
    @transaction.destroy
    
      redirect_to transactions_url
      flash[:danger]='Transaction was successfully destroyed.'
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:productType, :liters, :vehicleNumber, :user_id,:image)
    end
end
