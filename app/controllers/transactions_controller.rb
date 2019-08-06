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

    respond_to do |format|
      @current_user = current_user
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    @current_user = current_user
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @current_user = current_user
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:productType, :liters, :vehicleNumber, :user_id)
    end
end
